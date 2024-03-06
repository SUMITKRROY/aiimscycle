import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aiimscycle/config/theamdata.dart';

class CustomTextField extends StatefulWidget {
  final String? initialValue;
  final void Function(String) onChanged;
  final String label;
  final String validatorLabel;
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
      required this.validatorLabel,
      this.initialValue,
      required this.onChanged,
      this.controller,
      this.obscured = false,
      this.suffixIcon,
      this.keyboardType,
      this.maxline,
      required this.validator, this.validatorFunc});

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
      style: const TextStyle(fontSize: 18, color: ColorsData.darkGrayColor),
      inputFormatters: widget.inputFormatters,
      validator: widget.validator != false
      ? widget.validatorFunc
         : (val) {
        // If widget.validator is null, return null indicating no error
        return null;
      },
      controller: widget.controller ?? _controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          suffixIcon: widget.suffixIcon,
          labelText: widget.label,
          filled: true),
      obscureText: widget.obscured,
    );
  }
}
