// import 'package:flutter/material.dart';
// //import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// class ReadAboutSpecies extends StatefulWidget {
//   const ReadAboutSpecies(
//       {Key? key, required this.species, required this.pdfLink})
//       : super(key: key);

//   final String species;
//   final String pdfLink;
//   @override
//   _ReadAboutSpeciesState createState() => _ReadAboutSpeciesState();
// }

// class _ReadAboutSpeciesState extends State<ReadAboutSpecies> {
//   bool _isLoading = true;
//   // late  PDFDocument document;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('${widget.species}'),
//         ),
//         body: SfPdfViewer.network('${widget.pdfLink}'));
//   }
// }
