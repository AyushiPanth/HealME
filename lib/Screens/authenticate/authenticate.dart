import 'package:flutter/material.dart';
import 'package:healme/Screens/Login/login_screen.dart';
import 'package:healme/Screens/wrapper.dart';
import 'package:healme/Services/auth.dart';
import 'package:healme/models/user.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user, child: Wrapper());
  }
}
