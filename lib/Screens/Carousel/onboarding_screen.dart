import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healme/Screens/welcome/welcome_screen.dart';
import 'package:healme/constants.dart';
import 'package:healme/utilities.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator(height) {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true, height) : _indicator(false, height));
    }
    return list;
  }

  Widget _indicator(bool isActive, height) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: height * 0.02),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : kPrimaryLightColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build (BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold (
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              Container (
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WelcomeScreen();
                          },
                        ),
                      );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle (
                      color: kPrimaryColor,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: 600.0,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/onboarding0.png',
                              ),
                              height: size.height * 0.45,
                              width: size.width * 0.78,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Center(
                            child: Text(
                              'When you breath,\nyou relax. ',
                              style: kTitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Center(
                            child: Text(
                              'Meditation and yoga are the best tools to get control and peace back in life.',
                              style: kSubtitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/onboarding3.png',
                              ),
                              height: size.height * 0.45,
                              width: size.width * 0.78,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Center(
                            child: Text(
                              'Stress doesn\'t kill,\nreaction does.',
                              style: kTitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Center(
                            child: Text(
                              'Get peace by listening to soothing music and change your reaction',
                              style: kSubtitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/onboarding2.png',
                              ),
                              height: size.height * 0.45,
                              width: size.width * 0.78,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Center(
                            child: Text(
                              'Worried about calories \nwhile sitting at home?',
                              style: kTitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Center(
                            child: Text(
                              'Use our calorie counter to measure your diet effectively.',
                              style: kSubtitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(size.height),
              ),
              _currentPage != _numPages - 1
                  ? Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ),
              )
                  : Text(''),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomeScreen();
                  },
                ),
              );
            },
            child: Container (
                  height: size.height * 0.08,
                  width: double.infinity,
                  color: kPrimaryColor,
                  child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                        child: Text(
                          'Get started',
                          style: TextStyle(
                            color: kPrimaryLightColor,
                            fontSize: 20.0,
                        ),
                      ),
                    ),
                ),
              ),
          )
          : Text (''),
    );
  }
}