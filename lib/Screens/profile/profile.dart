import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:healme/Screens/welcome/welcome_screen.dart';
import 'package:healme/Services/auth.dart';
import 'package:healme/Services/database.dart';
import 'package:healme/constants.dart';
import 'package:healme/components/rounded_button.dart';
import 'package:healme/models/user.dart';
import 'package:healme/shared/loading.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentName;
  int _currentAge;
  double _currentWeight;
  double _currentHeight;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileView(),
    );
  }

  Widget profileView() {
    //final user = Provider.of<User>(context);
    //Size size = MediaQuery.of(context).size;
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                      child: Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              //initialValue: userdata.name,
                              validator: (value) => value.isEmpty
                                  ? 'Please enter your name'
                                  : null,
                              onChanged: (value) =>
                                  setState(() => _currentName = value),
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Sarah",
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
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              //initialValue: userdata.age.toString(),
                              style: TextStyle(color: Colors.white),
                              validator: (value) => value.isEmpty
                                  ? 'Please enter your age'
                                  : null,
                              onChanged: (value) => setState(
                                  () => _currentAge = int.parse(value)),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "20 Years",
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
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              // initialValue: userdata.weight.toString(),
                              style: TextStyle(color: Colors.white),
                              validator: (value) => value.isEmpty
                                  ? 'Please enter your weight'
                                  : null,
                              onChanged: (value) => setState(
                                  () => _currentWeight = double.parse(value)),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "58 Kg",
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
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Container(
                        height: 60,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              //  initialValue: userdata.height.toString(),
                              style: TextStyle(color: Colors.white),
                              validator: (value) => value.isEmpty
                                  ? 'Please enter your height'
                                  : null,
                              onChanged: (value) => setState(
                                  () => _currentHeight = double.parse(value)),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "157 cm",
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
                    SizedBox(height: 10.0),
                    RoundedButton(
                        text: "Update Profile",
                        color: kPrimaryLightColor,
                        textColor: kPrimaryColor,
                        press: () async {
                          // if (_formKey.currentState.validate()) {
                          //  await DatabaseService(uid: user.uid)
                          //      .updateUserData(
                          //         _currentName ?? userdata.name,
                          //         _currentAge ?? userdata.age,
                          //        _currentWeight ?? userdata.weight,
                          //        _currentHeight ?? userdata.height);

                          //   Navigator.pop(context);
                          //  }
                        }),
                    SizedBox(height: 10.0),
                    RoundedButton(
                        text: "Sign Out",
                        color: kPrimaryLightColor,
                        textColor: kPrimaryColor,
                        press: () async {
                          await _auth.signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WelcomeScreen();
                              },
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
