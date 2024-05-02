import 'package:aiimscycle/bloc/config_cubit/config_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/appbar.dart';
import '../../utils/image.dart';

class VersionScreen extends StatefulWidget {
  const VersionScreen({super.key});

  @override
  State<VersionScreen> createState() => _VersionScreenState();
}

class _VersionScreenState extends State<VersionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Version",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
              ),
            ),
            BlocBuilder<ConfigCubit, ConfigState>(
              builder: (context, state) {
                if (state is ConfigLoadedState) {
                  return Text(
                    state.version ?? '',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
                  );
                } else {
                  return Text(
                    ' No Version Specified',
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  );
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Image.asset(
              ImagePath.logo,
              height: 150,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("GRIEVANCE PORTAL",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Simplify staff transportation with our user-friendly cycle rental service. Staff can quickly browse and book cycles through the app, promoting eco-friendly commuting within the AIIMS campus.",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
