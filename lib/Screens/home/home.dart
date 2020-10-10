import 'package:flutter/material.dart';
import 'package:healme/Services/auth.dart';
import 'package:healme/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        title: Text("HealME"),
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                await _auth.signOut();
              })
        ],
      ),
    );
  }
}
