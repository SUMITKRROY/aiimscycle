import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/view/my_cycle_page.dart';
import 'package:flutter/material.dart';

import '../components/appbar.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
      ),
      body: Center(
        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(ImagePath.cycle,),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProductListPage()),);
            }, child: Text("Scan now"))
        ],),
      ),
    );
  }
}
