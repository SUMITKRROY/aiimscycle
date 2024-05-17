import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../../components/appbar.dart';
import '../../utils/helper_text.dart';
import '../user/exception_screen.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({Key? key});

  final String screenName = 'Terms and condition Screen';

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const CustomAppBar(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Terms of Use",
                style: TextStyle(fontSize: 24.sp),
              ),
              SizedBox(height: 10.h),
              Text('''1. Information We Collect:\n
    - We collect the following information to ensure secure and personalized access to our services:\n- Patient's mobile number for account authentication\n- Patient's email address for communication and updates\n- Unique Hospital Identification (UHID) for patient identity verification\n- Location: With user consent, we may collect location information to provide location-based services and enhance user experience.\n- Camera: We may access the device's camera functionality for specific features such as uploading images or documents, but this access is contingent upon user permission.\n- Gallery: Access to the device's gallery may be requested to allow users to upload images or documents, again, contingent upon user consent.\n- Microphone: We may request access to the device's microphone for certain features such as voice messaging, with user permission.\n- Phone: i want to know about the application info #collect proper data\n\n
    2. Use of Information:\n
    - We utilize the collected information for the following purposes:\n- Secure identity verification of patients\n- Timely communication with patients regarding grievance resolution updates\n - Enhancing and customizing our services to meet user needs\n
    3. Information Sharing:\n
    - Patient information is strictly confidential and will not be shared with any third parties unless required by law or with explicit user consent.\n
    4. Security:\n
    - We employ robust security measures to safeguard all collected information against unauthorized access, alteration, disclosure, or destruction.\n
    5. Changes to Privacy Policy:\n
    - Any updates or modifications to our privacy policy will be promptly communicated to users through the application or via email.\n
    6. Contact Us:\n
    - For any inquiries or concerns regarding our privacy practices, please contact us at privacy[at]santushtapp[dot]com.\n
    '''),
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
