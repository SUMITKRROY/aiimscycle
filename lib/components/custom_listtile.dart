import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget leadingIcon;
  final String label;
  final dynamic screen;
  final Widget trailingIcon;

  const CustomListTile({
    Key? key,
    required this.leadingIcon,
    required this.label,
    this.screen,
    this.trailingIcon = const Icon(Icons.arrow_forward_ios),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      trailing: trailingIcon,
      title: Text(label),
      onTap: screen != null
          ? () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      }
          : null,
    );
  }
}
