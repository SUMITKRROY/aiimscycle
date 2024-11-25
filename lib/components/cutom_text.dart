import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String label;
  double? fontSize;
  Color? fontColor;
  bool alignment;

  CustomText({
    super.key,
    required this.label,
    this.fontSize,
    this.fontColor,
    this.alignment = false
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        // color: fontColor ?? Colors.white,
      ),
      textAlign: alignment ? TextAlign.center : TextAlign.start,
    );
  }
}