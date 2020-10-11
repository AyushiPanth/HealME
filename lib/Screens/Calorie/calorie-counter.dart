import 'package:flutter/material.dart';
import 'package:healme/Screens/Calorie/water-intake.dart';
import 'package:healme/components/rounded_button.dart';
import 'package:healme/constants.dart';
import 'dashboard.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

int breakfast = 0;
int mor_snack = 0;
int lunch = 0;
int eve_snack = 0;
int dinner = 0;

class CalorieCounter extends StatefulWidget {
  @override
  _CalorieCounterState createState() => _CalorieCounterState();
}

class _CalorieCounterState extends State<CalorieCounter> {
  var _pageState = 0;
  double _profileOffset = 0;

  void _breakfast() {
    setState(() {
      breakfast += 10;
    });
  }

  void _morning_snacks() {
    setState(() {
      mor_snack += 10;
    });
  }

  void _lunch() {
    setState(() {
      lunch += 10;
    });
  }

  void _evening_snacks() {
    setState(() {
      eve_snack += 10;
    });
  }

  void _dinner() {
    setState(() {
      dinner += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    switch (_pageState) {
      case 0:
        _profileOffset = size.height;
        break;
      case 1:
        _profileOffset = 120;
    }

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.darkBlue,
        title: new Text(
          "Calorie Counter",
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
                padding: EdgeInsets.fromLTRB(15, 22, 15, 0),
                child: Container(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: size.width * 0.43,
                        height: size.width * 0.43,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kwhite,
                        ),
                        child: Image.asset(
                          'assets/img/bolt.png',
                          width: 50,
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
                                  '0 Calories'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '1200 Calories'.toUpperCase(),
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
                              progressColor: kyellow,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                            ),
                            Text(
                              'Calories'.toUpperCase(),
                              style: TextStyle(
                                color: kyellow,
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
                                            color:
                                            Theme.of(context).primaryColor,
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
                              color: kyellow,
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
                                      return WaterIntake();
                                    },
                                  ),
                                );
                              },
                              width: size.width * 0.45,
                              title: 'Water Intake',
                              achieved: 2,
                              total: 6,
                              color: kPrimaryColor,
                              image: Image.asset('assets/img/water.png',
                                  width: size.width * 0.15),
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
                              achieved: 652,
                              total: 1000,
                              color: kred,
                              image: Image.asset('assets/img/shoe.png',
                                  width: size.width * 0.1),
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
                          color: kyellow,
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
                        "Calories Profile",
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Which meal would you like to track?",
                  style: TextStyle(color: kwhite),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        _breakfast();
                      },
                      color: kPrimaryColor,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Breakfast                $breakfast of 400 Cal',
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
                    RaisedButton(
                      onPressed: () {
                        _morning_snacks();
                      },
                      color: kPrimaryColor,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Morning Snack       $mor_snack of 200 Cal',
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
                    RaisedButton(
                      onPressed: () {
                        _lunch();
                      },
                      color: kPrimaryColor,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Lunch                      $lunch of 600 Cal',
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
                    RaisedButton(
                      onPressed: () {
                        _evening_snacks();
                      },
                      color: kPrimaryColor,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Evening Snacks      $eve_snack of 200 Cal',
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
                    RaisedButton(
                      onPressed: () {
                        _dinner();
                      },
                      color: kPrimaryColor,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Dinner                     $dinner of 600 Cal',
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
                SizedBox(
                  height: 20,
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

