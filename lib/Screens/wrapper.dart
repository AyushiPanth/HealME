import 'package:flutter/material.dart';
import 'package:healme/Screens/authenticate/authenticate.dart';
import 'package:healme/Screens/home/home.dart';
import 'package:healme/Screens/welcome/components/body.dart';
import 'package:healme/Screens/welcome/welcome_screen.dart';
import 'package:healme/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return WelcomeScreen();
    } else {
      return Main();
    }
  }
}
