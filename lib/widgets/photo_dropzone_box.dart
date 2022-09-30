import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../utilities/colors/constants.dart';

class PhotoDropZone extends StatelessWidget {
  const PhotoDropZone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: DottedBorder(
        dashPattern: const [6, 3],
        borderType: BorderType.RRect,
        color: kDarkGreyColor,
        radius: const Radius.circular(12),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            height: 240,
            width: double.infinity,
            color: Colors.grey[350],
            child: Opacity(
              opacity: 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add_photo_alternate_rounded),
                    iconSize: 40,
                    onPressed: () => {},
                  ),
                  const Text("Add photo of plant"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UploadPreview extends StatelessWidget {
  const UploadPreview({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: DottedBorder(
        dashPattern: const [6, 3],
        borderType: BorderType.RRect,
        color: Colors.white,
        radius: const Radius.circular(12),
        // padding: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
              height: 240,
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.all(15),
              child: FittedBox(
                  fit: BoxFit.cover,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(File(imagePath)),
                  ))),
        ),
      ),
    );
  }
}
