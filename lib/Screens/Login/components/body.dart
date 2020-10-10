import 'package:flutter/material.dart';
import 'package:healme/Screens/Login/components/background.dart';
import 'package:healme/Screens/Signup/signup_screen.dart';
import 'package:healme/components/already_have_an_account_acheck.dart';
import 'package:healme/components/rounded_button.dart';
import 'package:healme/components/rounded_input_field.dart';
import 'package:healme/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login",
              style: TextStyle(fontSize: 25, fontFamily: 'Sketch'),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/login.png",
              height: size.height * 0.45,
              width: size.width * 0.85,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Email id",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Login",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
