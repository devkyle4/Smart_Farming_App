import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../utilities/colors/constants.dart';
import '../../utilities/values.dart';
import '../../widgets/button.dart';
import '../../widgets/photo_dropzone_box.dart';
import '../../widgets/screen_header.dart';
import '../back_button_appbar.dart';
import 'package:http_parser/http_parser.dart';

class UploadWeed extends StatefulWidget {
  @override
  State<UploadWeed> createState() => _UploadWeedState();
}

class _UploadWeedState extends State<UploadWeed> {
  final ImagePicker _picker = ImagePicker();
  String baseUrl = "http://127.0.0.1:8000";
  XFile? _image;
  String weedType = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonedAppBar(),
      body: Container(
        padding: Values.screenPadding,
        child: ListView(
          children: [
            const ScreenHeader(
              header: "Upload a photo of your weed",
              description:
                  " Please upload picture of foreign plant for detection, ensure the picture is visible and taken from the right angle",
            ),
            const SizedBox(
              height: 25,
            ),
            _image != null
                ? UploadPreview(
                    imagePath: _image!.path,
                  )
                : GestureDetector(
                    onTap: () async => {
                          _image = await _picker.pickImage(
                              source: ImageSource.gallery),
                          setState(() {})
                        },
                    child: const PhotoDropZone()),
            const SizedBox(
              height: 25,
            ),
            if (isLoading) ...[
              const CircularProgressIndicator(
                color: Colors.lightGreen,
                strokeWidth: 4.0,
              )
            ],
            Button(
                label: "Proceed",
                onButtonTap: () async {
                  if (_image!=null) {
                    uploadImage(_image!.name, await _image!.readAsBytes());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'No image chosen',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.black87,
                      ),
                    );
                  }
                }),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () async => {
                _image = await _picker.pickImage(source: ImageSource.gallery),
                setState(() {})
              },
              style: TextButton.styleFrom(
                onSurface: kBlueColor,
              ),
              child: const Text("Upload a different photo"),
            ),
          ],
        ),
      ),
    );
  }

  uploadImage(String filename, Uint8List binary) async {
    var request = http.MultipartRequest("POST", Uri.parse("$baseUrl/predict"))
      ..files.add(http.MultipartFile.fromBytes('file', binary,
          filename: filename,
          contentType: MediaType.parse("multipart/form-data")));
    setState(() {
      isLoading = true;
    });
    return request.send().then((value) async {
      Response response = await http.Response.fromStream(value);
      setState(() {
        weedType = jsonDecode(response.body)['weed'];
        isLoading = false;
        print(weedType);
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => Container(
            height: 360.0,
            child: Center(
              child: RichText(
                  text: TextSpan(
                    text: 'Weed is a',
                    style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: weedType,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                 // selectionColor: Colors.black26
                  ),
            ),
          ),
          bounce: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        );
      });
    });
  }
}
