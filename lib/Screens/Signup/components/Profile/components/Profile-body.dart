import 'package:flutter/material.dart';
import 'package:healme/components/rounded_button.dart';
import 'package:healme/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  //form values

  String _currentName;
  int _currentAge;
  double _currentWeight;
  double _currentHeight;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
          TextFormField(
            validator: (value) => value.isEmpty ? 'Please enter your name' : null,
            onChanged: (value) => setState(() => _currentName = value),
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
          TextFormField(
            validator: (value) => value.isEmpty ? 'Please enter your age' : null,
            onChanged: (value) => setState(() => _currentAge = int.parse(value)),
            cursorColor: kwhite,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.home,
              ),
              hintText: "Age",
              hintStyle: TextStyle(color: kwhite),
            ),
          ),
          TextFormField(
            validator: (value) => value.isEmpty ? 'Please enter your weight' : null,
            onChanged: (value) => setState(() => _currentWeight = double.parse(value)),
            cursorColor: kwhite,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.accessibility,
              ),
              hintText: "Weight",
              hintStyle: TextStyle(color: kwhite),
            ),
          ),
          TextFormField(
            validator: (value) => value.isEmpty ? 'Please enter your height' : null,
            onChanged: (value) => setState(() => _currentHeight = double.parse(value)),
            cursorColor: kwhite,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.home,
              ),
              hintText: "Height",
              hintStyle: TextStyle(color: kwhite),
            ),
          ),
  ]));
  }
}

