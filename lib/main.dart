import 'package:flutter/material.dart';
import 'package:healme/constants.dart';
import 'Screens/Carousel/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healer',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: kPrimaryColor,
        textTheme: TextTheme(bodyText2: TextStyle(color: kPrimaryColor),),
        buttonTheme: ButtonThemeData(
          buttonColor: kPrimaryColor,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: OnboardingScreen(),
    );
  }
}

