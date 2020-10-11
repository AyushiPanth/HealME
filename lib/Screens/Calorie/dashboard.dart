import 'package:flutter/material.dart';
import 'package:healme/Screens/Calorie/water-intake.dart';
import 'package:healme/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:healme/components/rounded_button.dart';

import 'calorie-counter.dart';

int steps = 0;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final myController = TextEditingController();
  var _pageState = 0;
  double _profileOffset = 0;
  void _noofSteps() {
    setState(() {
      steps += 10;
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
          "Steps Tracker",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
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
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: klightred,
                      ),
                      child: Image.asset(
                        'assets/img/shoe.png',
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
                                '0 Steps'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '9000 Steps'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          LinearPercentIndicator(
                            lineHeight: 8.0,
                            percent: 0.7,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor: klightred,
                            progressColor: kred,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                          ),
                          Text(
                            'Steps Taken'.toUpperCase(),
                            style: TextStyle(
                              color: kred,
                              fontFamily: 'Sketch',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'You walked 165 min today',
                            style: TextStyle(
                              color: kred,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 25,
                      color: klightred,
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
                      color: klightred,
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
                            color: kred,
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
                            image: Image.asset('assets/img/bolt.png',
                                width: size.width * 0.1),
                          ),
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
                            color: Theme.of(context).primaryColor,
                            image: Image.asset('assets/img/water.png',
                                width: size.width * 0.15),
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
                        color: kred,
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
                        "Steps Profile",
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
                  "How many steps would you like to track?",
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
                        _noofSteps();
                      },
                      color: kPrimaryColor,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              ' $steps Steps',
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

class StatCard extends StatelessWidget {
  final String title;
  final double total;
  final double achieved;
  final Image image;
  final Color color;
  final double width;
  final Function press;

  const StatCard({
    Key key,
    @required this.title,
    @required this.total,
    @required this.achieved,
    @required this.image,
    @required this.color,
    @required this.width,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: width,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: kPrimaryLightColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: color,
                    fontSize: 14,
                  ),
                ),
                achieved < total
                    ? Image.asset(
                  'assets/img/down_orange.png',
                  width: 20,
                )
                    : Image.asset(
                  'assets/img/up_red.png',
                  width: 20,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 8.0,
              percent: achieved / (total < achieved ? achieved : total),
              circularStrokeCap: CircularStrokeCap.round,
              center: image,
              progressColor: color,
              backgroundColor: Theme.of(context).accentColor.withAlpha(30),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: achieved.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: color,
                  ),
                ),
                TextSpan(
                  text: ' / $total',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}