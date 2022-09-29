import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
import '../../utilities/colors/constants.dart';
import '../../utilities/values.dart';
// import '../../widgets/back_buttoned_appbar.dart';
import '../../widgets/button.dart';
import '../../widgets/photo_dropzone_box.dart';
import '../../widgets/screen_header.dart';
// import '../confirm_extracted_data.dart';
// import '../wrappers/photo_scanning_async_wrapper.dart';
import '../back_button_appbar.dart';

class UploadWeed extends StatefulWidget {
  @override
  State<UploadWeed> createState() => _UploadWeedState();
}

class _UploadWeedState extends State<UploadWeed> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

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
            Button(label: "Proceed", onButtonTap: () async => {}
                //   context.read<OCRProvider>().setImageByteFile =
                //   await _image!.readAsBytes(),
                //   context.read<OCRProvider>().setFileName = _image!.name,
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //           const PhotoScanningAsyncWrapper()))
                // },
                // disabled: _image == null,
                ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () async => {
                _image = await _picker.pickImage(source: ImageSource.gallery),
                setState(() {})
              },
              style: TextButton.styleFrom(
                primary: kBlueColor,
              ),
              child: const Text("Upload a different photo"),
            )
          ],
        ),
      ),
    );
  }
}
