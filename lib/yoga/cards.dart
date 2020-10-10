import 'package:flutter/material.dart';

Widget poseCard(String title, String spots, icon, String img) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/$img.png"),
          fit: BoxFit.scaleDown,
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