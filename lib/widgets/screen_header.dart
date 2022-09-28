import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    super.key,
    required this.header,
    required this.description,
    this.headerTextStyle,
    this.descriptionTextOpacity = 0.8,
    this.spaceBetween = 10,
    this.child,
  });

  final Widget? child;
  final String header;
  final TextStyle? headerTextStyle;
  final double spaceBetween;
  final String description;
  final double descriptionTextOpacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: headerTextStyle ??
              Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(inherit: true, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: spaceBetween),
        Opacity(
          opacity: descriptionTextOpacity,
          child: Text(description),
        ),
        child ?? const SizedBox.shrink()
      ],
    );
  }
}
