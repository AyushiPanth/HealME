import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:healme/constants.dart';

import 'cards.dart';

class Poses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.darkBlue,
        title: new Text(
          "Yoga Asanas",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=IR6P23o822s&ab_channel=Beachbody")) {
                          await launch(
                              "https://www.youtube.com/watch?v=IR6P23o822s&ab_channel=Beachbody");
                        }
                      },
                      child: Container(
                          height:  MediaQuery.of(context).size.width * .5,
                          width: MediaQuery.of(context).size.width * .5,
                          child: poseCard("", "", Icons.accessibility, "yoga1")),
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=gMgDEfTqVd0&ab_channel=Spotebi")) {
                          await launch(
                              "https://www.youtube.com/watch?v=gMgDEfTqVd0&ab_channel=Spotebi");
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * .5,
                        width: MediaQuery.of(context).size.width * .5,
                        child:
                        poseCard("", "", Icons.bluetooth_searching, "yoga2"),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=JmW6Ofblhtk&ab_channel=YogaJournal")) {
                          await launch(
                              "https://www.youtube.com/watch?v=JmW6Ofblhtk&ab_channel=YogaJournal");
                        }
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.width * .5,
                          width: MediaQuery.of(context).size.width * .5,
                          child: poseCard("", "", Icons.attach_money, "yoga3")),
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=33L6oog4sbY&ab_channel=YogaonGaia")) {
                          await launch(
                              "https://www.youtube.com/watch?v=33L6oog4sbY&ab_channel=YogaonGaia");
                        }
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.width * .5,
                          width: MediaQuery.of(context).size.width * .5,
                          child: poseCard("", "", Icons.brightness_5, "yoga4")),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=v1IkTK16XUQ&ab_channel=YogaJournal")) {
                          await launch(
                              "https://www.youtube.com/watch?v=v1IkTK16XUQ&ab_channel=YogaJournal");
                        }
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.width * .5,
                          width: MediaQuery.of(context).size.width * .5,
                          child: poseCard("", "", Icons.accessibility, "yoga5")),
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=IiHkMae4yNU&ab_channel=YogaJournal")) {
                          await launch(
                              "https://www.youtube.com/watch?v=IiHkMae4yNU&ab_channel=YogaJournal");
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * .5,
                        width: MediaQuery.of(context).size.width * .5,
                        child:
                        poseCard("", "", Icons.bluetooth_searching, "yoga6"),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=NytDpa2r34g&ab_channel=AloMoves-OnlineYoga%26FitnessVideos")) {
                          await launch(
                              "https://www.youtube.com/watch?v=NytDpa2r34g&ab_channel=AloMoves-OnlineYoga%26FitnessVideos");
                        }
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.width * .5,
                          width: MediaQuery.of(context).size.width * .5,
                          child: poseCard("", "", Icons.attach_money, "yoga7")),
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=WphcbGWzfRk&ab_channel=HFE%28HealthandFitnessEducation%29")) {
                          await launch(
                              "https://www.youtube.com/watch?v=WphcbGWzfRk&ab_channel=HFE%28HealthandFitnessEducation%29");
                        }
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * .5,
                          child: poseCard("", "", Icons.brightness_5, "yoga8")),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=WphcbGWzfRk&ab_channel=HFE%28HealthandFitnessEducation%29")) {
                          await launch(
                              "https://www.youtube.com/watch?v=WphcbGWzfRk&ab_channel=HFE%28HealthandFitnessEducation%29");
                        }
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.width * .5,
                          width: MediaQuery.of(context).size.width * .5,
                          child: poseCard("", "", Icons.accessibility, "yoga9")),
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=SnoFGPZTjs0&ab_channel=TheArtofLiving")) {
                          await launch(
                              "https://www.youtube.com/watch?v=SnoFGPZTjs0&ab_channel=TheArtofLiving");
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width * .5,
                        width: MediaQuery.of(context).size.width * .5,
                        child:
                        poseCard("", "", Icons.bluetooth_searching, "yoga10"),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=uG8bxWrj_t0&ab_channel=Sivanandacanada")) {
                          await launch(
                              "https://www.youtube.com/watch?v=uG8bxWrj_t0&ab_channel=Sivanandacanada");
                        }
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.width * .5,
                          width: MediaQuery.of(context).size.width * .5,
                          child: poseCard("", "", Icons.attach_money, "yoga11")),
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunch(
                            "https://www.youtube.com/watch?v=i4TY6Oui-XI&ab_channel=YogabyCandace")) {
                          await launch(
                              "https://www.youtube.com/watch?v=i4TY6Oui-XI&ab_channel=YogabyCandace");
                        }
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.width * .5,
                          width: MediaQuery.of(context).size.width * .5,
                          child: poseCard("", "", Icons.brightness_5, "yoga12")),
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