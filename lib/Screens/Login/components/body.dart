import 'package:flutter/material.dart';
import 'package:healme/Screens/Login/components/background.dart';
import 'package:healme/Screens/Signup/signup_screen.dart';
import 'package:healme/Services/auth.dart';
import 'package:healme/components/already_have_an_account_acheck.dart';
import 'package:healme/components/rounded_button.dart';
import 'package:healme/components/rounded_input_field.dart';
import 'package:healme/components/rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // text field state
  String email = '';
  String password = '';
  String error = '';

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                validate: (value) => value.isEmpty ? 'Enter an email' : null,
                hintText: "Email id",
                onChanged: (value) {
                  setState(() => email = value);
                },
              ),
              RoundedPasswordField(
                validate: (value) =>
                    value.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
              RoundedButton(
                text: "Login",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.signInWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() => error = 'Could not sign in with those credentials');
                    }
                  }
                },
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
      ),
    );
  }
}
