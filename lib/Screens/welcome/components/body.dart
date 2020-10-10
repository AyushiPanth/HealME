import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healme/Screens/Login/login_screen.dart';
import 'package:healme/Screens/Signup/signup_screen.dart';
import 'package:healme/constants.dart';
import 'package:healme/components/rounded_button.dart';
import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Self Love",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 35,
                  fontFamily: 'Sketch',
                ),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset("assets/icons/pray.png",
              height: size.height * 0.45,
              width: size.width * 0.85,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Login",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Sign up",
              color: kPrimaryLightColor,
              textColor: kPrimaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



