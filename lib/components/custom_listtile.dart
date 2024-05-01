import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget leadingIcon;
  final VoidCallback onTap;
  final String label;
  // final dynamic screen;
  final Widget trailingIcon;

  const CustomListTile({
    Key? key,
    required this.leadingIcon,
    required this.label,
    // this.screen,
    this.trailingIcon = const Icon(Icons.arrow_forward_ios), required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      trailing: trailingIcon,
      title: Text(label),
      onTap: onTap
    );
  }
}
