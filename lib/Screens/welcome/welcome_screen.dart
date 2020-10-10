import 'package:flutter/material.dart';
import 'package:healme/Screens/welcome/components/body.dart';
import 'package:healme/Screens/wrapper.dart';
import 'package:healme/Services/auth.dart';
import 'package:healme/models/user.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Body(),
    );
  }
}
