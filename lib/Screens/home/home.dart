import 'package:flutter/material.dart';
import 'package:healme/Services/auth.dart';
import 'package:healme/constants.dart';
import 'package:healme/shared/custom_cards.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        backgroundColor: kPrimaryColor,
        title: new Text(
          "Calorie Counter",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      backgroundColor: kwhite,
          body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width * 0.25,
                    child: customCard(
                        "", ".", Icons.access_alarm, "assets/images/Healthy")),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width * 0.25,
                    child: customCard(
                        "", ".", Icons.access_alarm, "assets/images/Meditation")),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width * 0.25,
                    child: customCard(
                        "", ".", Icons.access_alarm, "assets/images/music")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}