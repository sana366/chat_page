// @dart=2.9

import 'package:flutter/material.dart';

import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/sms_page.dart';

import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';

import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(const Twilio());
}

class Twilio extends StatelessWidget {
  const Twilio({Key key}) : super(key: key);

  // const Twilio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,

      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      initialRoute: MyRoutes.HomeRoute,

      routes: {
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.SmsRoute: (context) => SmsPage(),


      },


    );
  }




}