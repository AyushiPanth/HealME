import 'package:flutter/material.dart';
import 'playlist.dart';
import 'package:healme/constants.dart';

import 'custom_card.dart';

class Music extends StatelessWidget {
  final double appBarHeight = AppBar().preferredSize.height;
  final double navBarHeight = 100.0;
  final double extendedAppBarHeight = 50.0;
  final double topCardHeight = 175.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.darkBlue,
        title: new Text(
          "HealMe",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
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
                        builder: (context) => PlayList1(
                          title: "HealMe",
                        ),
                      ),
                    );
                  },
                  child: Container(
                      height: 225.0,
                      width: MediaQuery.of(context).size.width,
                      child: customCard("", ".", Icons.access_alarm, "1")),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayList2(
                              title: "HealMe",
                            ),
                          ),
                        );
                      },
                      child: Container(
                          height: ((MediaQuery.of(context).size.height) -
                                  appBarHeight -
                                  extendedAppBarHeight -
                                  topCardHeight +
                                  40) *
                              .35,
                          width: MediaQuery.of(context).size.width * .5,
                          child: customCard("", "", Icons.accessibility, "2")),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayList3(
                              title: "HealMe",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) -
                                appBarHeight -
                                navBarHeight -
                                extendedAppBarHeight -
                                topCardHeight) *
                            .55,
                        width: MediaQuery.of(context).size.width * .5,
                        child: customCard("", "", Icons.bluetooth_searching, "3"),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayList4(
                              title: "HealMe",
                            ),
                          ),
                        );
                      },
                      child: Container(
                          height: ((MediaQuery.of(context).size.height) -
                                  appBarHeight -
                                  navBarHeight -
                                  extendedAppBarHeight -
                                  topCardHeight) *
                              .55,
                          width: MediaQuery.of(context).size.width * .5,
                          child: customCard("", "", Icons.attach_money, "4")),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayList5(
                              title: "HealMe",
                            ),
                          ),
                        );
                      },
                      child: Container(
                          height: ((MediaQuery.of(context).size.height) -
                                  appBarHeight -
                                  extendedAppBarHeight -
                                  topCardHeight +
                                  42) *
                              .35,
                          width: MediaQuery.of(context).size.width * .5,
                          child: customCard("", "", Icons.brightness_5, "5")),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
