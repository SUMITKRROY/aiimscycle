// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:aiimscycle/provider/logger_db_cubit/logger_db_cubit.dart';
// import 'package:intl/intl.dart';
//
// import 'components/button.dart';
// import 'components/custom_TextFeild.dart';
//
// class SetDBData extends StatefulWidget {
//   SetDBData({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _SetDBDataState createState() => _SetDBDataState();
// }
//
// class _SetDBDataState extends State<SetDBData> {
//   final _formKey = GlobalKey<FormState>(); // Add a GlobalKey for the Form
//
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _contentController = TextEditingController();
//   int selectedIndex = -1;
//   DateTime selectedDate = DateTime.now();
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//       });
//   }
//
//   // final List<String> iconPaths = [
//   //   ImagePath.icon1,
//   //   ImagePath.icon2,
//   //   ImagePath.icon3,
//   //   ImagePath.icon4,
//   //
//   // ];
//   TimeOfDay selectedStartTime = TimeOfDay.now();
//   TimeOfDay selectedEndTime = TimeOfDay.now();
//
//   Future<void> _selectTime(BuildContext context, bool isStartTime) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: isStartTime ? selectedStartTime : selectedEndTime,
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStartTime) {
//           selectedStartTime = picked;
//         } else {
//           selectedEndTime = picked;
//         }
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Add Event",
//           style: TextStyle(color: Colors.black87),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey, // Assign the GlobalKey to the Form
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Container(
//                   child: Text(
//                     'Event no. 1', // Convert widget.index to string
//                     style: TextStyle(color: Colors.black87, fontSize: 18),
//                   ),
//                 ),
//                 SizedBox(height: 12.0),
//                 CustomTextField(
//                   label: 'Task name',
//                   onChanged: (val) => {},
//                   controller: _titleController,
//                   keyboardType: TextInputType.text,
//                   validatorLabel: 'task name',
//                   validator: true,
//                 ),
//                 SizedBox(height: 12.0),
//                 Text("Photo"),
//                 SizedBox(height: 08.0),
//                 Text("Date"),
//                 SizedBox(height: 08.0),
//                 GestureDetector(
//                   onTap: () {
//                     _selectDate(context);
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(10.0),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.grey,
//                         width: 1.0,
//                       ),
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Center(
//                       child: Text(
//                         DateFormat('MMMM dd, yyyy').format(selectedDate),
//                         style: TextStyle(fontSize: 16.0),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 12.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         Text("Start Time"),
//                         GestureDetector(
//                           onTap: () {
//                             _selectTime(context, true);
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               '${selectedStartTime.hour}:${selectedStartTime.minute.toString().padLeft(2, '0')}',
//                               style: TextStyle(fontSize: 16.0),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text("End Time"),
//                         GestureDetector(
//                           onTap: () {
//                             _selectTime(context, false);
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               '${selectedEndTime.hour}:${selectedEndTime.minute.toString().padLeft(2, '0')}',
//                               style: TextStyle(fontSize: 16.0),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 12.0),
//                 Text("About event"),
//                 SizedBox(height: 08.0),
//                 TextFormField(
//                   controller: _contentController,
//                   maxLines: 2,
//                   keyboardType: TextInputType.text,
//                   textInputAction: TextInputAction.next,
//                   decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.all(16),
//                       // suffixIcon: widget.suffixIcon,
//                       hintText: "description",
//                       filled: true),
//                   validator: (val) {
//                     if (val == '') return 'Enter a valid ';
//                   },
//                 ),
//                 // CustomTextField(
//                 //   label: 'Description',
//                 //   onChanged: (val) => {},
//                 //   controller: _contentController,
//                 //   keyboardType: TextInputType.text, maxline: 2, validatorLabel: 'Description', validator: true,
//                 //
//                 // ),
//                 SizedBox(height: 12.0),
//                 ElevatedButton(onPressed: () => saveDataToTable(), child: Text("create a log"))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void saveDataToTable() {
//     if (_formKey.currentState!.validate()) {
//       int id = 12;
//       String title = _titleController.text;
//       String content = _contentController.text;
//       String date = DateFormat('yyyy-MM-dd').format(selectedDate); // Formatted date
//       String startTime =
//           '${selectedStartTime.hour}:${selectedStartTime.minute.toString().padLeft(2, '0')}';
//
//       BlocProvider.of<LoggerDbCubit>(context).setLogData(
//         description: content,
//         screenName: title,
//       );
//       // BlocProvider.of<PlayListBloc>(context).add(
//       //   PlayListsuccessEvent(id: id, title: title, content: content, imagePath: imagePath, date: date, startTime: startTime, endTime: endTime),
//       // );
//       // BlocProvider.of<PlayListBloc>(context).add(
//       //   NotegetEvent(),
//       // );
//       // Navigator.pop(context);
//     }
//   }
// }
