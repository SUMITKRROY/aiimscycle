import 'package:aiimscycle/bloc/profile_cubit/profile_cubit.dart';
import 'package:aiimscycle/bloc/profile_cubit/profile_modal.dart';
import 'package:aiimscycle/components/loader.dart';
import 'package:aiimscycle/view/extra_screen/error_screen.dart';
import 'package:aiimscycle/view/user/cycle_booking_screen.dart';
import 'package:aiimscycle/view/user/cycle_detail_screen.dart';
import 'package:aiimscycle/view/extra_screen/exception_screen.dart';
import 'package:aiimscycle/view/user/scanner_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfile();
    requestLocationPermission();

    super.initState();
  }

  Future<bool> requestLocationPermission() async {
    // Request location permission
    var status = await Permission.location.request();

    // Return true if permission is granted, false otherwise
    return status.isGranted;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          List<AllRequest> sortedPersons =
              state.allReq.toList(); // Make a copy of the original list
          sortedPersons.sort((a, b) => (b.id ?? 0).compareTo(a.id ?? 0));
          if (state.profileModal.issuedCycle == null && sortedPersons.first.status == 'PENDING') {
            return CycleBookingScreen(cycleId: sortedPersons.first.id.toString() ?? '');
          }
          if (state.profileModal.issuedCycle != null) {
            return CycleDetailPage(
              cycleId: "${state.profileModal.issuedCycle?.id ?? ''}",
              Status: true,
            );
          } else {
            return ScannerPage();
          }
        }
        if (state is ProfileLoading) {
          return Loader();
        }
        return ExceptionScreen();
      },
    );
  }
}
