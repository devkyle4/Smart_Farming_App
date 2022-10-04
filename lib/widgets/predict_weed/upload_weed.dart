import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:final_year_project/widgets/read_about_species.dart';
import 'package:final_year_project/widgets/read_more.dart';
import 'package:final_year_project/widgets/webvieweg.dart';
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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../utilities/reading_links.dart';

class UploadWeed extends StatefulWidget {
  @override
  State<UploadWeed> createState() => _UploadWeedState();
}

class _UploadWeedState extends State<UploadWeed> {
  final ImagePicker _picker = ImagePicker();
  String baseUrl = "https://0995-102-176-65-234.eu.ngrok.io";
  XFile? _image;
  String weedType = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const BackButtonedAppBar(),
      body: Container(
        padding: Values.screenPadding,
        child: ListView(
          children: [
            const ScreenHeader(
              header: "Upload a photo of your weed",
              description:
                  " Please upload picture of weed plant for identification, ensure the picture is visible and taken from the right angle",
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
              const SpinKitRotatingCircle(
                color: Color.fromARGB(255, 13, 58, 15),
                size: 40.0,
              )
            ],
            Button(
                label: "Proceed",
                onButtonTap: () async {
                  if (_image != null) {
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
                // ignore: deprecated_member_use
                onSurface: kBlueColor,
              ),
              child: const Text(
                "Upload a different photo",
                style: TextStyle(color: Colors.red),
              ),
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
            height: MediaQuery.of(context).size.height * 0.3,
            child: PredictionOutputDisplay(weedType: weedType),
          ),
          bounce: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        );
      });
    });
  }
}

class PredictionOutputDisplay extends StatelessWidget {
  const PredictionOutputDisplay({
    Key? key,
    required this.weedType,
  }) : super(key: key);

  final String weedType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Prediction output",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Weed species ",
                    style: TextStyle(color: Colors.black26, fontSize: 19)),
                SizedBox(
                  width: 3,
                ),
                Text(
                  weedType,
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 119, 185, 121)),
                ),
              ],
            ),
          ),
          weedType.toLowerCase() == "other"
              ? GestureDetector(
                  onTap: () {
                    print("pdf url");
                    print(links[weedType]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => WebViewExample()));
                  },child: Text("${links['other']}"))
              : GestureDetector(
                  onTap: () {
                    print("pdf url");
                    print(links[weedType]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ReadMoreWebView(
                                species: weedType,
                                link: "${links[weedType]}")));
                  },
                  child: Text(
                    "Read more about $weedType",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )),
        ],
      ),
    );
  }
}
