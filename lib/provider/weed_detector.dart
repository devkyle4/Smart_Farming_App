// import 'package:camera/camera.dart';
// import 'package:flutter/foundation.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import '../model/weed.dart';
// import '../services/api/verification_service.dart';
// import '../services/verification_service_impl.dart';
//
// class WeedProvider with ChangeNotifier {
//   final VerificationService verificationService = VerificationServiceImpl();
//   late Uint8List _imageByteFile;
//   late String _fileName;
//
//   set setImageByteFile(Uint8List byteFile) {
//     _imageByteFile = byteFile;
//   }
//
//   set setFileName(String fileName) {
//     _fileName = fileName;
//   }
//
//   Future<XFile?> cropImage({required XFile imageFile}) async {
//     CroppedFile? croppedImage =
//     await ImageCropper().cropImage(sourcePath: imageFile.path);
//     if (croppedImage == null) return null;
//     return XFile(croppedImage.path);
//   }
//
//   Future<Weed> getWeed() {
//     return verificationService.getWeed(_imageByteFile, _fileName);
//   }
// }
