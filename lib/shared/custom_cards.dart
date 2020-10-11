import 'package:flutter/material.dart';

class AppColors {
  static const mainColor = Color(0XFFe5eefc);
  static const styleColor = Color(0XFF6f7e96);
  static const activeColor = Color(0XFFd0ddf3);
  static const lightBlue = Color(0XFFcce0ff);
  static const darkBlue = Color(0XFF0047b3);
  static const lightBlueShadow = Color(0XFFcce0ff);
}

Widget customCard(String title, String spots, icon, String img) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightBlue,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(3, 3), // changes position of shadow
          ),
        ],
        border: Border.all(color: Color(0XFF0047b3), width: 3),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("$img.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'S',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  spots,
                  style: TextStyle(
                    fontFamily: 'S',
                    color: Colors.blue,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
