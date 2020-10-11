import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healme/Screens/Login/login_screen.dart';
import 'package:healme/Screens/Signup/components/Profile/components/Profile-body.dart';
import 'package:healme/Screens/Signup/components/background.dart';
import 'package:healme/Screens/Signup/components/or_divider.dart';
import 'package:healme/Screens/Signup/components/social_icon.dart';
import 'package:healme/Services/auth.dart';
import 'package:healme/components/already_have_an_account_acheck.dart';
import 'package:healme/components/rounded_button.dart';
import 'package:healme/components/rounded_input_field.dart';
import 'package:healme/components/rounded_password_field.dart';
import 'package:healme/constants.dart';
import 'package:healme/models/info.dart';
import 'package:healme/shared/loading.dart';
import 'package:healme/Services/database.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // text field state
  String email = '';
  String password = '';
  String error = '';

  var _pageState = 0;
  double _profileOffset = 0;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //switch (_pageState) {
      //case 0:
        //_profileOffset = size.height;
        //break;
      //case 1:
        //_profileOffset = 270;
    //}

    return loading
        ? Loading()
        : Stack(
            children: <Widget>[
              Background(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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
                          validate: (value) =>
                              value.isEmpty ? 'Enter an email' : null,
                          hintText: "Email id",
                          onChanged: (value) {
                            setState(() => email = value);
                          },
                        ),
                        RoundedPasswordField(
                          validate: (value) => value.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (value) {
                            setState(() => password = value);
                          },
                        ),
                        RoundedButton(
                            text: "Sign up",
                            press: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                  _pageState = 1;
                                });
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Please supply a valid email';
                                    loading = false;
                                  });
                                }
                              }
                            }),
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
              ),
              //AnimatedContainer(
              //  padding: EdgeInsets.all(20),
               // width: double.infinity,
               // curve: Curves.fastLinearToSlowEaseIn,
             //   duration: Duration(
             //     milliseconds: 1500,
            //    ),
            //    transform: Matrix4.translationValues(0, _profileOffset, 1),
            //    decoration: BoxDecoration(
           //         color: kPrimaryColor,
          //          borderRadius: BorderRadius.only(
           //           topLeft: Radius.circular(30),
           //           topRight: Radius.circular(30),
            //        )),
           //     child: Column(
            //      children: <Widget>[
              //      Row(
               //       children: <Widget>[
                //        GestureDetector(
                 //         child: Icon(
                //            Icons.arrow_back_ios,
                 //           color: kwhite.withOpacity(0.8),
                 //         ),
                  //        onTap: () {
                //            setState(() {
                  //            _pageState = 0;
                  //          });
                  //        },
                   //     ),
                  //      Expanded(
                 //         child: Text(
                   //         "Profile",
                     //       textAlign: TextAlign.center,
                     //       style: TextStyle(
                       //       color: kwhite,
                         //     fontSize: 25,
                           //   fontFamily: 'Sketch',
                 //           ),
                   //       ),
                     //   ),
      //                ],
        //            ),
          //          Column(children: [
            //          Profile(),
              //      ]),
                //    RoundedButton(
                  //    color: kPrimaryLightColor,
                    //  textColor: kPrimaryColor,
//                      text: "Setup Profile",
  //                    press: () {},
    //                ),
      //            ],
        //        ),
          //    ),
            ],
          );
  }
}
