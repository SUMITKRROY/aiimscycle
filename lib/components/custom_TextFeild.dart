import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aiimscycle/config/theamdata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String? initialValue;
  final void Function(String) onChanged;
  final String label;
  final double? labelFontSize;
  final dynamic validatorLabel;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscured;
  final bool validator;
  final dynamic suffixIcon;
  final dynamic validatorFunc;
  final dynamic maxline;

  const CustomTextField(
      {super.key,
      required this.label,
      this.inputFormatters,
      this.validatorLabel,
      this.initialValue,
      required this.onChanged,
      this.controller,
      this.obscured = false,
      this.suffixIcon,
      this.keyboardType,
      this.maxline,
      required this.validator,
      this.validatorFunc,
      this.labelFontSize});

  @override
  @override
  State<CustomTextField> createState() {
    return _CustomTextField();
  }
}

class _CustomTextField extends State<CustomTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = widget.initialValue ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: widget.maxline,
      style: TextStyle(fontSize: 20.sp, color: ColorsData.darkGrayColor),
      inputFormatters: widget.inputFormatters,
      validator: widget.validatorFunc ??
          (val) {
            if (widget.validator != false) {
              if (val == null || val.isEmpty) {
                return "Enter valid ${widget.validatorLabel}";
              }
            }
            return null;
          },
      controller: widget.controller ?? _controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.h),
          suffixIcon: widget.suffixIcon,
          labelText: widget.label,
          labelStyle: TextStyle(fontSize: widget.labelFontSize ?? 20.sp),
          errorMaxLines: 2,
          hintStyle: TextStyle(fontSize: 10.sp),
          errorStyle: TextStyle(fontSize: 16.sp),
          filled: true),
      obscureText: widget.obscured,
    );
  }
}
