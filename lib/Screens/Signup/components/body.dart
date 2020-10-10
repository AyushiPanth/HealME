import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healme/Screens/Login/login_screen.dart';
import 'package:healme/Screens/Signup/components/background.dart';
import 'package:healme/Screens/Signup/components/or_divider.dart';
import 'package:healme/Screens/Signup/components/social_icon.dart';
import 'package:healme/components/already_have_an_account_acheck.dart';
import 'package:healme/components/rounded_button.dart';
import 'package:healme/components/rounded_input_field.dart';
import 'package:healme/components/rounded_password_field.dart';
import 'package:healme/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _pageState = 0;
  double _profileOffset = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    switch (_pageState) {
      case 0:
        _profileOffset = size.height;
        break;
      case 1:
        _profileOffset = 270;
    }

    return Stack(
      children: <Widget>[
        Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                Text(
                  "Sign up",
                  style: TextStyle(fontSize: 25, fontFamily: 'Sketch'),
                ),
                Image.asset(
                  "assets/icons/signup.png",
                  height: size.height * 0.45,
                  width: size.width * 0.85,
                ),
                RoundedInputField(
                  hintText: "Email id",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: "Setup Profile",
                  press: () {
                    setState(() {
                      _pageState = 1;
                    });
                  },
                ),
                SizedBox(height: size.height * 0.01),
                AlreadyHaveAnAccountCheck(
                  login: false,
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
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/icons/google.svg",
                      press: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            milliseconds: 1500,
          ),
          transform: Matrix4.translationValues(0, _profileOffset, 1),
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kwhite.withOpacity(0.8),
                    ),
                    onTap: () {
                      setState(() {
                        _pageState = 0;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "Profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kwhite,
                        fontSize: 25,
                        fontFamily: 'Sketch',
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                onChanged: (value) {},
                cursorColor: kwhite,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  hintText: "Name",
                  hintStyle: TextStyle(color: kwhite),
                ),
              ),
              RoundedButton(
                text: "Sign up",
                color: kPrimaryLightColor,
                textColor: kPrimaryColor,
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
