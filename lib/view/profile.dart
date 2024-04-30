import 'package:flutter/material.dart';
import '../components/appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(titleSpacing: 0, title: CustomAppBar()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              // crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, right: 20, left: 20, bottom: 10),
                      child: CircleAvatar(
                        radius: width * 0.25,
                        backgroundColor: Colors.grey,
                        // backgroundImage: const NetworkImage("")
                      )),
                ),
                const SizedBox(
                  height: 08,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Sumit Kumar Roy"),
                ),
                ListTile(
                  leading: Icon(Icons.deblur),
                  title: Text("flutter developer"),
                ),
                ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text("E9999999"),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Update"),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
