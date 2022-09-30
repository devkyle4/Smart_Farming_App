// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:final_year_project/model/weed.dart';
// import 'package:http/http.dart';
// //import 'package:knust_axis/models/student.dart';
// //import 'package:knust_axis/models/id_card.dart';
// //import 'package:knust_axis/sevices/api/verification_service.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
//
// import 'api/verification_service.dart';
//
// const baseUrl = "https://116c-129-122-16-55.eu.ngrok.io";
//
// class VerificationServiceImpl implements VerificationService {
//   @override
//   // Future<Weed> getWeed(Uint8List byteData, String fileName) async {
//   //   var uri = Uri.parse('${baseUrl}scan-id');
//   //   MultipartRequest request = http.MultipartRequest('POST', uri)
//   //     ..files.add(await http.MultipartFile.fromBytes('file', byteData,
//   //         contentType: MediaType.parse("multipart/form-data"),
//   //         filename: fileName));
//   //
//   //   return await request.send().then((value) async {
//   //     Response response = await http.Response.fromStream(value);
//   //     return IDCard.fromJSON(jsonDecode(response.body));
//   //   });
//   // }
//
//   @override
//   Future<Weed> getWeed(String body) async {
//     var uri = Uri.parse('${baseUrl}predict');
//     String bodyString = jsonEncode(body);
//
//     return await http
//         .post(uri,
//         headers: {
//           "Accept": "application/json",
//           "Content-Type": "application/json"
//         },
//         encoding: Encoding.getByName('utf-8'),
//         body: bodyString)
//         .then((response) {
//       return Weed.fromJSON(jsonDecode(response.body));
//     });
//   }
//
// }
