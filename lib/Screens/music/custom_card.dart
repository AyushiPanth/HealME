import 'package:flutter/material.dart';

Widget customCard(String title, String spots, icon, String img) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [ //background color of box
          BoxShadow(
            color: Colors.black,
            blurRadius: 3.0, // soften the shadow
            spreadRadius: 0.6, //extend the shadow
            offset: Offset(
              1.0, // Move to right 10  horizontally
              1.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        border: Border.all(color: Colors.blueAccent, width: 3),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/images/$img.png"),
          fit: BoxFit.cover,
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
