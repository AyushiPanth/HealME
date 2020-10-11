import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:healme/constants.dart';
import 'package:healme/components/rounded_button.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileView(),
    );
  }

  Widget profileView() {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.darkBlue,
        title: new Text(
          "Profile Details",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/1.png',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFF0047B3),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ))
              ],
            ),
          ),
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xFF0047B3), Color(0xFF0047B3)])),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                        child: Container(
                          height: 60,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                onChanged: (value) {},
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Name",
                                  contentPadding: const EdgeInsets.all(5.0),
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border:
                              Border.all(width: 1.0, color: Colors.white70)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                        child: Container(
                          height: 60,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                onChanged: (value) {},
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Age",
                                  contentPadding: const EdgeInsets.all(5.0),
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border:
                              Border.all(width: 1.0, color: Colors.white70)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                        child: Container(
                          height: 60,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                onChanged: (value) {},
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Weight",
                                  contentPadding: const EdgeInsets.all(5.0),
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border:
                              Border.all(width: 1.0, color: Colors.white70)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                        child: Container(
                          height: 60,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                onChanged: (value) {},
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Height",
                                  contentPadding: const EdgeInsets.all(5.0),
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border:
                              Border.all(width: 1.0, color: Colors.white70)),
                        ),
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
              ))
        ],
      ),
    );
  }
}
