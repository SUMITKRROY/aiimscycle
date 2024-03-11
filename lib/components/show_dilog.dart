// import 'package:flutter/material.dart';
//
// class CustomDialog extends StatelessWidget {
//   final String label;
//   final String content;
//
//   const CustomDialog({
//     Key? key,
//     required this.label,
//     required this.content,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) =>  AlertDialog(
//         title: Text(label),
//         content: Text(content),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // To close the dialog
//             },
//             child: Text('Close'),
//           ),
//         ],
//       ),
//     );
//   }
// }
