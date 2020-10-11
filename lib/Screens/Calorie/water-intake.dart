import 'package:flutter/material.dart';
import 'package:healme/constants.dart';
import 'calorie-counter.dart';
import 'dashboard.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:healme/Screens/Signup/components/background.dart';
import 'package:healme/components/rounded_button.dart';
import 'dart:math' as math;

class WaterIntake extends StatefulWidget {
  @override
  _WaterIntakeState createState() => _WaterIntakeState();
}

int water = 0;

class _WaterIntakeState extends State<WaterIntake> {
  var _pageState = 0;
  double _profileOffset = 0;
  final myController = TextEditingController();
  void _intake() {
    setState(() {
      water += 1;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    switch (_pageState) {
      case 0:
        _profileOffset = size.height;
        break;
      case 1:
        _profileOffset = 70;
    }

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.darkBlue,
        title: new Text(
          "Water Intake",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      backgroundColor: kwhite,
      body: Stack(
          children: <Widget>[
          SingleChildScrollView(
            child: Padding(
            padding: EdgeInsets.fromLTRB(15, 30, 15, 25),
              child: Container(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.38,
                      height: size.width * 0.38,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: kPrimaryLightColor,
                      ),
                      child: Image.asset(
                        'assets/img/water.png',
                        width: 60,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '0 Glasses'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '6 Glasses'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          LinearPercentIndicator(
                            lineHeight: 8.0,
                            percent: 0.3,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor:
                            Theme.of(context).accentColor.withAlpha(30),
                            progressColor: Theme.of(context).primaryColor,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                          ),
                          Text(
                            'Water Intake'.toUpperCase(),
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: 'Sketch',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 25,
                      color: kPrimaryLightColor,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'DISTANCE',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '8500',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: kred,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' m',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'CALORIES',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '259',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: kyellow,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' cal',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'WATER INTAKE',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '2/6',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Glasses',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 25,
                      color: kPrimaryLightColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'OTHER PROGRESS',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 24,
                            fontFamily: 'Sketch',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: size.height * 0.3,
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: ListView(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          StatCard(
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CalorieCounter();
                                  },
                                ),
                              );
                            },
                            width: size.width * 0.45,
                            title: 'Calories',
                            achieved: 200,
                            total: 350,
                            color: Colors.orange,
                            image: Image.asset('assets/img/bolt.png', width: size.width *0.1),
                          ),
                          StatCard(
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Dashboard();
                                  },
                                ),
                              );
                            },
                            width: size.width * 0.45,
                            title: 'Steps Taken',
                            achieved: 2,
                            total: 6,
                            color: kred,
                            image: Image.asset('assets/img/shoe.png', width: size.width * 0.1),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.2,
                      height: size.width * 0.2,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: kPrimaryColor,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: kwhite,
                        ),
                        onPressed: () {
                          setState(() {
                            _pageState = 1;
                          });
                        },
                      ),
                    ),
                  ],
                ),
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
    "Water Profile",
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
    SizedBox(height: 30),
    Text(
    "What is your daily water intake?",
    style: TextStyle(color: kwhite),
    ),
    Column(
    children: <Widget>[
    SizedBox(height: 20),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    InkWell(
    onTap: () {},
    child: Container(
    height: 50,
    width: MediaQuery.of(context).size.width -
    MediaQuery.of(context).size.width * 0.25,
    child: TextField(
    style: TextStyle(color: Colors.white),
    controller: myController,
    decoration: InputDecoration(
    border: InputBorder.none,
    hintText: 'Target',
    hintStyle: TextStyle(color: Colors.white),
    ),
    ),
    ),
    )
    ],
    ),
    RaisedButton(
    onPressed: () {
    _intake();
    },
    color: kPrimaryColor,
    child: Padding(
    padding:
    EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Text(
    'Intake                     $water Glasses',
    style: TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    ),
    ),
    Icon(
    Icons.add,
    color: Colors.white,
    )
    ],
    ),
    ),
    ),
    ],
    ),
    RoundedButton(
    text: "Save",
    color: kPrimaryLightColor,
    textColor: kPrimaryColor,
    press: () {},
    ),
    ],
    ),
    ),
        ],
      ),
    );
  }
}
