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
              Text(
                'Open Source Libraries',
                style: TextStyle(fontSize: 24.sp),
              ),
              SizedBox(height: 10.h),
              Text('''
## Open Source Licenses

The AIIMS Cycle mobile application utilizes open source software. We are committed to acknowledging the work of the open source community and providing the necessary information and licenses. Below is a list of the open source libraries and software used in our app, along with their respective licenses.

### Libraries and Licenses

1. *Library Name*: Retrofit
   - *Description*: A type-safe HTTP client for Android and Java.
   - *License*: Apache License 2.0
   - *Link*: [Retrofit License](https://github.com/square/retrofit/blob/master/LICENSE.txt)

2. *Library Name*: OkHttp
   - *Description*: An HTTP & HTTP/2 client for Android and Java applications.
   - *License*: Apache License 2.0
   - *Link*: [OkHttp License](https://github.com/square/okhttp/blob/master/LICENSE.txt)

3. *Library Name*: Glide
   - *Description*: An image loading and caching library for Android.
   - *License*: BSD, part MIT, and Apache License 2.0
   - *Link*: [Glide License](https://github.com/bumptech/glide/blob/master/LICENSE)

4. *Library Name*: Gson
   - *Description*: A Java library that can be used to convert Java Objects into their JSON representation.
   - *License*: Apache License 2.0
   - *Link*: [Gson License](https://github.com/google/gson/blob/master/LICENSE)

5. *Library Name*: Room
   - *Description*: The Room persistence library provides an abstraction layer over SQLite to allow for more robust database access while harnessing the full power of SQLite.
   - *License*: Apache License 2.0
   - *Link*: [Room License](https://developer.android.com/jetpack/androidx/releases/room#license)

### Full Text of Open Source Licenses

#### Apache License 2.0

text
                                 Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.
      "License" shall mean the terms and conditions for use, reproduction,
      and distribution as defined by Sections 1 through 9 of this document.
      ...

   [Full license text]


#### BSD License

text
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
   ...

   [Full license text]


#### MIT License

text
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
   ...

   [Full license text]


### Disclaimer

AIIMS Cycle does not claim ownership of any open source libraries listed above. The licenses of these libraries are owned by their respective authors.

### Contact Us

If you have any questions or concerns about our use of open source software, please contact us at:

[Your Contact Information]
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
