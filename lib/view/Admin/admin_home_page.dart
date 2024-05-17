import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../user/drawer_screen.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 35.w),
            // labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            // indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            tabs: const [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.hail)),
              Tab(icon: Icon(Icons.pin_drop)),
            ],
          ),
          title: Text('Admin Screen'),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.green,
              child: Center(
                child: Text('siddhant'),
              ),
            ),
            Container(color: Colors.red),
            Container(color: Colors.yellow),
          ],
        ),
      ),
    );
  }
}
