import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../../components/appbar.dart';
import '../../utils/helper_text.dart';
import '../extra_screen/exception_screen.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

  final String screenName = 'Open Source lib Screen';

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
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black), // Define the default text style
                  children: <TextSpan>[
                    TextSpan(text: 'Open Source Licenses\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),

                    TextSpan(text: 'The AIIMS Cycle mobile application utilizes open source software. We are committed to acknowledging the work of the open source community and providing the necessary information and licenses. Below is a list of the open source libraries and software used in our app, along with their respective licenses.\n\n'),

                    TextSpan(text: 'Libraries and Licenses\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

                    TextSpan(text: '1. *Library Name*: Retrofit\n', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '   - *Description*: A type-safe HTTP client for Android and Java.\n'),
                    TextSpan(text: '   - *License*: Apache License 2.0\n'),
                    TextSpan(text: '   - *Link*: '),
                    TextSpan(
                      text: 'Retrofit License\n\nhttps://github.com/square/retrofit/blob/master/LICENSE.txt',
                      style: TextStyle(color: Colors.blue),
                    ),

                    TextSpan(text: '\n2. *Library Name*: OkHttp\n', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '   - *Description*: An HTTP & HTTP/2 client for Android and Java applications.\n'),
                    TextSpan(text: '   - *License*: Apache License 2.0\n'),
                    TextSpan(text: '   - *Link*: '),
                    TextSpan(
                      text: 'OkHttp License\n\nhttps://github.com/square/okhttp/blob/master/LICENSE.txt',
                      style: TextStyle(color: Colors.blue),

                    ),

                    TextSpan(text: '\n3. *Library Name*: Glide\n', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '   - *Description*: An image loading and caching library for Android.\n'),
                    TextSpan(text: '   - *License*: BSD, part MIT, and Apache License 2.0\n'),
                    TextSpan(text: '   - *Link*: '),
                    TextSpan(
                      text: 'Glide License\n\nhttps://github.com/bumptech/glide/blob/master/LICENSE',
                      style: TextStyle(color: Colors.blue),
                    ),

                    TextSpan(text: '\n4. *Library Name*: Gson\n', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '   - *Description*: A Java library that can be used to convert Java Objects into their JSON representation.\n'),
                    TextSpan(text: '   - *License*: Apache License 2.0\n'),
                    TextSpan(text: '   - *Link*: '),
                    TextSpan(
                      text: 'Gson License\n\nhttps://github.com/google/gson/blob/master/LICENSE',
                      style: TextStyle(color: Colors.blue),

                    ),

                    TextSpan(text: '\n5. *Library Name*: Room\n', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '   - *Description*: The Room persistence library provides an abstraction layer over SQLite to allow for more robust database access while harnessing the full power of SQLite.\n'),
                    TextSpan(text: '   - *License*: Apache License 2.0\n'),
                    TextSpan(text: '   - *Link*: '),
                    TextSpan(
                      text: 'Room License\n\nhttps://developer.android.com/jetpack/androidx/releases/room#license',
                      style: TextStyle(color: Colors.blue),
                    ),

                    TextSpan(text: '\nFull Text of Open Source Licenses\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

                    TextSpan(text: 'Apache License 2.0\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    TextSpan(text: '                    Apache License\n            Version 2.0, January 2004\n        http://www.apache.org/licenses/\n\n   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION\n\n   1. Definitions.\n      "License" shall mean the terms and conditions for use, reproduction,\n      and distribution as defined by Sections 1 through 9 of this document.\n      ...\n\n   [Full license text]\n\n'),

                    TextSpan(text: 'BSD License\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    TextSpan(text: 'text\nRedistribution and use in source and binary forms, with or without\nmodification, are permitted provided that the following conditions are met:\n   ...\n\n   [Full license text]\n\n'),

                    TextSpan(text: 'MIT License\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    TextSpan(text: 'text\nPermission is hereby granted, free of charge, to any person obtaining a copy\nof this software and associated documentation files (the "Software"), to deal\nin the Software without restriction, including without limitation the rights\nto use, copy, modify, merge, publish, distribute, sublicense, and/or sell\ncopies of the Software, and to permit persons to whom the Software is\nfurnished to do so, subject to the following conditions:\n   ...\n\n   [Full license text]\n\n'),

                    TextSpan(text: 'Disclaimer\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'AIIMS Cycle does not claim ownership of any open source libraries listed above. The licenses of these libraries are owned by their respective authors.\n\n'),

                    TextSpan(text: 'Contact Us\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'If you have any questions or concerns about our use of open source software, please contact us at:\n\n[Your Contact Information]\n\n'),
                  ],
                ),
              )

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
