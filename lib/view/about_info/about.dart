import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../../components/appbar.dart';
import '../../components/custom_listtile.dart';
import '../../route/route_generater.dart';
import '../../utils/helper_text.dart';
import '../user/exception_screen.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  final String screenName = 'About Us Screen';

  @override
  Widget build(BuildContext context) {
    try {
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
                  "ABOUT US",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                ),
              ),
              CustomListTile(
                leadingIcon: const Icon(Icons.privacy_tip),
                label: 'Privacy Policy',
                onTap: () => MyRoutes.navigateToPolicyScreen(context),
              ),
              CustomListTile(
                leadingIcon: const Icon(Icons.edit_document),
                label: 'Terms of use',
                onTap: () => MyRoutes.navigateToTermsScreen(context),
              ),
              CustomListTile(
                leadingIcon: const Icon(Icons.library_books_sharp),
                label: 'open source libraries',
                onTap: () => MyRoutes.navigateToLegalScreen(context),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      BlocProvider.of<LoggerDbCubit>(context).setLogData(
        description: CommonText.widgetExceptionText,
        screenName: screenName,
      );
      return ExceptionScreen();
    }
  }
}
