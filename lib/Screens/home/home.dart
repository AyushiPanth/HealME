import 'package:flutter/material.dart';
import 'package:healme/constants.dart';
import 'package:healme/models/user.dart';
import 'package:healme/shared/custom_cards.dart';
import 'package:provider/provider.dart';

import '../../navbar.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyHome(
                      index: 3,                    
                    );
                  },
                ),
              );
            },
          )
        ],
        backgroundColor: Color(0XFF0047b3),
        title: new Text(
          "HealME",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins' ,
          ),
        ),
      ),
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyHome(
                            index: 0,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.33,
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width * 0.10,
                      child: customCard("", ".", Icons.access_alarm,
                          "assets/images/Healthy")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyHome(
                            index: 1,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.33,
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width * 0.10,
                      child: customCard("", ".", Icons.access_alarm,
                          "assets/images/Meditation")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyHome(
                            index: 2,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                     height: MediaQuery.of(context).size.height * 0.33,
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width * 0.10,
                      child: customCard(
                          "", ".", Icons.access_alarm, "assets/images/music")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
