import 'dart:async';
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:volume/volume.dart';
import 'package:healme/constants.dart';
import 'custom_button.dart';
import 'music_source.dart';

class PlayList1 extends StatefulWidget {
  PlayList1(
      {Key key,
      this.title,
      this.sliderHeight = 48,
      this.min = 0,
      this.max = 10,
      this.fullWidth = false})
      : super(key: key);

      final String title;
      final double sliderHeight;
      final int min;
      final int max;
      final fullWidth;

  @override
  _PlayList1State createState() => _PlayList1State();
}

class _PlayList1State extends State<PlayList1> {
  double _value = 0;
  List<Musique> musique_list = [
    Musique('Heavy Heart', 'Kevin MacLeod', 'assets/images/1.png',
        'https://ia801901.us.archive.org/0/items/kevin-mac-leod-heavy-heart/KevinMacLeod-HeavyHeart.mp3'),
    Musique('Sleep', 'Scott Buckley', 'assets/images/1.png',
        'https://ia801404.us.archive.org/7/items/scott-buckley-sleep/ScottBuckley-Sleep.mp3'),
    Musique('Cherry Picking', 'Erothyme', 'assets/images/1.png',
        'https://ia803201.us.archive.org/20/items/erothyme-cherry-picking/Erothyme-CherryPicking.mp3'),
    Musique('Night', 'Cloudkicker', 'assets/images/1.png',
        'https://ia802803.us.archive.org/15/items/cloudkickernight/Cloudkicker_Night.mp3'),
  ];

  AudioPlayer audioPlayer;
  StreamSubscription positionSubscription;
  StreamSubscription stateSubscription;

  Musique actualMusic;
  Duration position = Duration(seconds: 0);
  Duration duree = Duration(seconds: 0);
  PlayerState status = PlayerState.STOPPED;
  int index = 0;
  bool mute = false;
  int maxVol = 0;
  int currentVol = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    actualMusic = musique_list[index];
    configAudioPlayer();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 7,
                right: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Playing Now',
                    style: TextStyle(
                      fontFamily: 'S',
                      color: AppColors.styleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonWidget(
              image: actualMusic.imagePath,
              size: MediaQuery.of(context).size.width * .7,
              borderWidth: 5,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PlayList1(),
                  ),
                );
              },
            ),
            Text(
              actualMusic.titre,
              style: TextStyle(
                fontFamily: 'S',
                color: AppColors.styleColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
            Text(
              actualMusic.auteur,
              style: TextStyle(
                fontFamily: 'S',
                color: AppColors.styleColor.withAlpha(90),
                fontSize: 16,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.darkBlue,
                  inactiveTrackColor: AppColors.lightBlue,
                  overlayColor: AppColors.lightBlue,
                  activeTickMarkColor: Colors.white,
                  inactiveTickMarkColor: Colors.red.withOpacity(.7),
                ),
                child: Slider(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duree.inSeconds.toDouble(),
                    onChanged: (double d) {
                      setState(() {
                        audioPlayer.seek(d);
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomButtonWidget(
                    size: 80,
                    onTap: () {
                      rewind();
                    },
                    child: Icon(
                      Icons.fast_rewind,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: (status != PlayerState.PLAYING) ? play : pause,
                    child: (status != PlayerState.PLAYING)
                        ? Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                    isActive: true,
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: forward,
                    child: Icon(
                      Icons.fast_forward,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  /// Initialialiser le volume
  Future<void> initPlatformState() async {
    await Volume.controlVolume(AudioManager.STREAM_MUSIC);
  }

  /// Gestion des texte avec style
  Text textWithStyle(String data, double scale) {
    return Text(
      data,
      textScaleFactor: scale,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 15.0),
    );
  }

  /// Gestion des boutons
  IconButton boutton(IconData icone, double taille, ActionMusic action) {
    return IconButton(
      icon: Icon(icone),
      iconSize: taille,
      color: Colors.white,
      onPressed: () {
        switch (action) {
          case ActionMusic.PLAY:
            play();
            break;
          case ActionMusic.PAUSE:
            pause();
            break;
          case ActionMusic.REWIND:
            rewind();
            break;
          case ActionMusic.FORWARD:
            forward();
            break;
          default:
            break;
        }
      },
    );
  }

  void configAudioPlayer() {
    audioPlayer = AudioPlayer();
    positionSubscription = audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
      if (position >= duree) {
        position = Duration(seconds: 0);
        // Passer à la musique suivante
      }
    });

    stateSubscription = audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.PLAYING) {
        setState(() {
          duree = audioPlayer.duration;
        });
      } else if (event == AudioPlayerState.STOPPED) {
        setState(() {
          status = PlayerState.STOPPED;
        });
      }
    }, onError: (message) {
      print(message);
      setState(() {
        status = PlayerState.STOPPED;
        duree = Duration(seconds: 0);
        position = Duration(seconds: 0);
      });
    });
  }

  Future play() async {
    await audioPlayer.play(actualMusic.musicUrl);
    setState(() {
      status = PlayerState.PLAYING;
    });
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() {
      status = PlayerState.PAUSED;
    });
  }

  Future muted() async {
    await audioPlayer.mute(!mute);
    setState(() {
      mute = !mute;
    });
  }

  void forward() {
    if (index == musique_list.length - 1) {
      index = 0;
    } else {
      index++;
    }
    actualMusic = musique_list[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }

  void rewind() {
    if (position > Duration(seconds: 3)) {
      audioPlayer.seek(0.0);
    } else {
      if (index == 0) {
        index = musique_list.length - 1;
      } else {
        index--;
      }
    }
    actualMusic = musique_list[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }

  String fromDuration(Duration duration) {
    return duration.toString().split('.').first;
  }
}

enum ActionMusic { PLAY, PAUSE, REWIND, FORWARD }

enum PlayerState { PLAYING, STOPPED, PAUSED }

class PlayList2 extends StatefulWidget {
  PlayList2(
      {Key key,
      this.title,
      this.sliderHeight = 48,
      this.min = 0,
      this.max = 10,
      this.fullWidth = false})
      : super(key: key);
  final String title;
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;

  @override
  _PlayList2State createState() => _PlayList2State();
}

class _PlayList2State extends State<PlayList2> {
  double _value = 0;
  List<Musique> musique_list = [
    Musique('Heavy Heart', 'Kevin MacLeod', 'assets/images/2.png',
        'https://ia801901.us.archive.org/0/items/kevin-mac-leod-heavy-heart/KevinMacLeod-HeavyHeart.mp3'),
    Musique('Sleep', 'Scott Buckley', 'assets/images/2.png',
        'https://ia801404.us.archive.org/7/items/scott-buckley-sleep/ScottBuckley-Sleep.mp3'),
    Musique('Cherry Picking', 'Erothyme', 'assets/images/2.png',
        'https://ia803201.us.archive.org/20/items/erothyme-cherry-picking/Erothyme-CherryPicking.mp3'),
    Musique('Night', 'Cloudkicker', 'assets/images/2.png',
        'https://ia802803.us.archive.org/15/items/cloudkickernight/Cloudkicker_Night.mp3'),
  ];

  AudioPlayer audioPlayer;
  StreamSubscription positionSubscription;
  StreamSubscription stateSubscription;

  Musique actualMusic;
  Duration position = Duration(seconds: 0);
  Duration duree = Duration(seconds: 0);
  PlayerState status = PlayerState.STOPPED;
  int index = 0;
  bool mute = false;
  int maxVol = 0;
  int currentVol = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    actualMusic = musique_list[index];
    configAudioPlayer();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.darkBlue,
        title: new Text(
          "HealMe",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'S',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 7,
                right: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Playing Now',
                    style: TextStyle(
                      fontFamily: 'S',
                      color: AppColors.styleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonWidget(
              image: actualMusic.imagePath,
              size: MediaQuery.of(context).size.width * .7,
              borderWidth: 5,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PlayList2(),
                  ),
                );
              },
            ),
            Text(
              actualMusic.titre,
              style: TextStyle(
                fontFamily: 'S',
                color: AppColors.styleColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
            Text(
              actualMusic.auteur,
              style: TextStyle(
                fontFamily: 'S',
                color: AppColors.styleColor.withAlpha(90),
                fontSize: 16,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.darkBlue,
                  inactiveTrackColor: AppColors.lightBlue,
                  overlayColor: AppColors.lightBlue,
                  activeTickMarkColor: Colors.white,
                  inactiveTickMarkColor: Colors.red.withOpacity(.7),
                ),
                child: Slider(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duree.inSeconds.toDouble(),
                    onChanged: (double d) {
                      setState(() {
                        audioPlayer.seek(d);
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomButtonWidget(
                    size: 80,
                    onTap: () {
                      rewind();
                    },
                    child: Icon(
                      Icons.fast_rewind,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: (status != PlayerState.PLAYING) ? play : pause,
                    child: (status != PlayerState.PLAYING)
                        ? Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                    isActive: true,
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: forward,
                    child: Icon(
                      Icons.fast_forward,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  /// Initialialiser le volume
  Future<void> initPlatformState() async {
    await Volume.controlVolume(AudioManager.STREAM_MUSIC);
  }

  /// Gestion des texte avec style
  Text textWithStyle(String data, double scale) {
    return Text(
      data,
      textScaleFactor: scale,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 15.0),
    );
  }

  /// Gestion des boutons
  IconButton boutton(IconData icone, double taille, ActionMusic action) {
    return IconButton(
      icon: Icon(icone),
      iconSize: taille,
      color: Colors.white,
      onPressed: () {
        switch (action) {
          case ActionMusic.PLAY:
            play();
            break;
          case ActionMusic.PAUSE:
            pause();
            break;
          case ActionMusic.REWIND:
            rewind();
            break;
          case ActionMusic.FORWARD:
            forward();
            break;
          default:
            break;
        }
      },
    );
  }

  void configAudioPlayer() {
    audioPlayer = AudioPlayer();
    positionSubscription = audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
      if (position >= duree) {
        position = Duration(seconds: 0);
        // Passer à la musique suivante
      }
    });

    stateSubscription = audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.PLAYING) {
        setState(() {
          duree = audioPlayer.duration;
        });
      } else if (event == AudioPlayerState.STOPPED) {
        setState(() {
          status = PlayerState.STOPPED;
        });
      }
    }, onError: (message) {
      print(message);
      setState(() {
        status = PlayerState.STOPPED;
        duree = Duration(seconds: 0);
        position = Duration(seconds: 0);
      });
    });
  }

  Future play() async {
    await audioPlayer.play(actualMusic.musicUrl);
    setState(() {
      status = PlayerState.PLAYING;
    });
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() {
      status = PlayerState.PAUSED;
    });
  }

  Future muted() async {
    await audioPlayer.mute(!mute);
    setState(() {
      mute = !mute;
    });
  }

  void forward() {
    if (index == musique_list.length - 1) {
      index = 0;
    } else {
      index++;
    }
    actualMusic = musique_list[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }

  void rewind() {
    if (position > Duration(seconds: 3)) {
      audioPlayer.seek(0.0);
    } else {
      if (index == 0) {
        index = musique_list.length - 1;
      } else {
        index--;
      }
    }
    actualMusic = musique_list[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }

  String fromDuration(Duration duration) {
    return duration.toString().split('.').first;
  }
}

class PlayList3 extends StatefulWidget {
  PlayList3(
      {Key key,
      this.title,
      this.sliderHeight = 48,
      this.min = 0,
      this.max = 10,
      this.fullWidth = false})
      : super(key: key);
  final String title;
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;

  @override
  _PlayList3State createState() => _PlayList3State();
}

class _PlayList3State extends State<PlayList3> {
  double _value = 0;
  List<Musique> musique_list = [
    Musique('Heavy Heart', 'Kevin MacLeod', 'assets/images/3.png',
        'https://ia801901.us.archive.org/0/items/kevin-mac-leod-heavy-heart/KevinMacLeod-HeavyHeart.mp3'),
    Musique('Sleep', 'Scott Buckley', 'assets/images/3.png',
        'https://ia801404.us.archive.org/7/items/scott-buckley-sleep/ScottBuckley-Sleep.mp3'),
    Musique('Cherry Picking', 'Erothyme', 'assets/images/3.png',
        'https://ia803201.us.archive.org/20/items/erothyme-cherry-picking/Erothyme-CherryPicking.mp3'),
    Musique('Night', 'Cloudkicker', 'assets/images/3.png',
        'https://ia802803.us.archive.org/15/items/cloudkickernight/Cloudkicker_Night.mp3'),
  ];

  AudioPlayer audioPlayer;
  StreamSubscription positionSubscription;
  StreamSubscription stateSubscription;

  Musique actualMusic;
  Duration position = Duration(seconds: 0);
  Duration duree = Duration(seconds: 0);
  PlayerState status = PlayerState.STOPPED;
  int index = 0;
  bool mute = false;
  int maxVol = 0;
  int currentVol = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    actualMusic = musique_list[index];
    configAudioPlayer();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.darkBlue,
        title: new Text(
          "HealMe",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'S',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 7,
                right: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Playing Now',
                    style: TextStyle(
                      fontFamily: 'S',
                      color: AppColors.styleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonWidget(
              image: actualMusic.imagePath,
              size: MediaQuery.of(context).size.width * .7,
              borderWidth: 5,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PlayList3(),
                  ),
                );
              },
            ),
            Text(
              actualMusic.titre,
              style: TextStyle(
                fontFamily: 'S',
                color: AppColors.styleColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
            Text(
              actualMusic.auteur,
              style: TextStyle(
                fontFamily: 'S',
                color: AppColors.styleColor.withAlpha(90),
                fontSize: 16,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.darkBlue,
                  inactiveTrackColor: AppColors.lightBlue,
                  overlayColor: AppColors.lightBlue,
                  activeTickMarkColor: Colors.white,
                  inactiveTickMarkColor: Colors.red.withOpacity(.7),
                ),
                child: Slider(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duree.inSeconds.toDouble(),
                    onChanged: (double d) {
                      setState(() {
                        audioPlayer.seek(d);
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomButtonWidget(
                    size: 80,
                    onTap: () {
                      rewind();
                    },
                    child: Icon(
                      Icons.fast_rewind,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: (status != PlayerState.PLAYING) ? play : pause,
                    child: (status != PlayerState.PLAYING)
                        ? Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                    isActive: true,
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: forward,
                    child: Icon(
                      Icons.fast_forward,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  /// Initialialiser le volume
  Future<void> initPlatformState() async {
    await Volume.controlVolume(AudioManager.STREAM_MUSIC);
  }

  /// Gestion des texte avec style
  Text textWithStyle(String data, double scale) {
    return Text(
      data,
      textScaleFactor: scale,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15.0,
        fontFamily: 'S',
      ),
    );
  }

  /// Gestion des boutons
  IconButton boutton(IconData icone, double taille, ActionMusic action) {
    return IconButton(
      icon: Icon(icone),
      iconSize: taille,
      color: Colors.white,
      onPressed: () {
        switch (action) {
          case ActionMusic.PLAY:
            play();
            break;
          case ActionMusic.PAUSE:
            pause();
            break;
          case ActionMusic.REWIND:
            rewind();
            break;
          case ActionMusic.FORWARD:
            forward();
            break;
          default:
            break;
        }
      },
    );
  }

  void configAudioPlayer() {
    audioPlayer = AudioPlayer();
    positionSubscription = audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
      if (position >= duree) {
        position = Duration(seconds: 0);
        // Passer à la musique suivante
      }
    });

    stateSubscription = audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.PLAYING) {
        setState(() {
          duree = audioPlayer.duration;
        });
      } else if (event == AudioPlayerState.STOPPED) {
        setState(() {
          status = PlayerState.STOPPED;
        });
      }
    }, onError: (message) {
      print(message);
      setState(() {
        status = PlayerState.STOPPED;
        duree = Duration(seconds: 0);
        position = Duration(seconds: 0);
      });
    });
  }

  Future play() async {
    await audioPlayer.play(actualMusic.musicUrl);
    setState(() {
      status = PlayerState.PLAYING;
    });
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() {
      status = PlayerState.PAUSED;
    });
  }

  Future muted() async {
    await audioPlayer.mute(!mute);
    setState(() {
      mute = !mute;
    });
  }

  void forward() {
    if (index == musique_list.length - 1) {
      index = 0;
    } else {
      index++;
    }
    actualMusic = musique_list[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }

  void rewind() {
    if (position > Duration(seconds: 3)) {
      audioPlayer.seek(0.0);
    } else {
      if (index == 0) {
        index = musique_list.length - 1;
      } else {
        index--;
      }
    }
    actualMusic = musique_list[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }

  String fromDuration(Duration duration) {
    return duration.toString().split('.').first;
  }
}

class PlayList4 extends StatefulWidget {
  PlayList4(
      {Key key,
      this.title,
      this.sliderHeight = 48,
      this.min = 0,
      this.max = 10,
      this.fullWidth = false})
      : super(key: key);
  final String title;
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;

  @override
  _PlayList4State createState() => _PlayList4State();
}

class _PlayList4State extends State<PlayList4> {
  double _value = 0;
  List<Musique> musique_list = [
    Musique('Heavy Heart', 'Kevin MacLeod', 'assets/images/4.png',
        'https://ia801901.us.archive.org/0/items/kevin-mac-leod-heavy-heart/KevinMacLeod-HeavyHeart.mp3'),
    Musique('Sleep', 'Scott Buckley', 'assets/images/4.png',
        'https://ia801404.us.archive.org/7/items/scott-buckley-sleep/ScottBuckley-Sleep.mp3'),
    Musique('Cherry Picking', 'Erothyme', 'assets/images/4.png',
        'https://ia803201.us.archive.org/20/items/erothyme-cherry-picking/Erothyme-CherryPicking.mp3'),
    Musique('Night', 'Cloudkicker', 'assets/images/4.png',
        'https://ia802803.us.archive.org/15/items/cloudkickernight/Cloudkicker_Night.mp3'),
  ];

  AudioPlayer audioPlayer;
  StreamSubscription positionSubscription;
  StreamSubscription stateSubscription;

  Musique actualMusic;
  Duration position = Duration(seconds: 0);
  Duration duree = Duration(seconds: 0);
  PlayerState status = PlayerState.STOPPED;
  int index = 0;
  bool mute = false;
  int maxVol = 0;
  int currentVol = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    actualMusic = musique_list[index];
    configAudioPlayer();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.darkBlue,
        title: new Text(
          "HealMe",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'S',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 7,
                right: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Playing Now',
                    style: TextStyle(
                      fontFamily: 'S',
                      color: AppColors.styleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonWidget(
              image: actualMusic.imagePath,
              size: MediaQuery.of(context).size.width * .7,
              borderWidth: 5,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PlayList4(),
                  ),
                );
              },
            ),
            Text(
              actualMusic.titre,
              style: TextStyle(
                fontFamily: 'S',
                color: AppColors.styleColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
            Text(
              actualMusic.auteur,
              style: TextStyle(
                fontFamily: 'S',
                color: AppColors.styleColor.withAlpha(90),
                fontSize: 16,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.darkBlue,
                  inactiveTrackColor: AppColors.lightBlue,
                  overlayColor: AppColors.lightBlue,
                  activeTickMarkColor: Colors.white,
                  inactiveTickMarkColor: Colors.red.withOpacity(.7),
                ),
                child: Slider(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duree.inSeconds.toDouble(),
                    onChanged: (double d) {
                      setState(() {
                        audioPlayer.seek(d);
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomButtonWidget(
                    size: 80,
                    onTap: () {
                      rewind();
                    },
                    child: Icon(
                      Icons.fast_rewind,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: (status != PlayerState.PLAYING) ? play : pause,
                    child: (status != PlayerState.PLAYING)
                        ? Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                    isActive: true,
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: forward,
                    child: Icon(
                      Icons.fast_forward,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  /// Initialialiser le volume
  Future<void> initPlatformState() async {
    await Volume.controlVolume(AudioManager.STREAM_MUSIC);
  }

  /// Gestion des texte avec style
  Text textWithStyle(String data, double scale) {
    return Text(
      data,
      textScaleFactor: scale,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 15.0),
    );
  }

  /// Gestion des boutons
  IconButton boutton(IconData icone, double taille, ActionMusic action) {
    return IconButton(
      icon: Icon(icone),
      iconSize: taille,
      color: Colors.white,
      onPressed: () {
        switch (action) {
          case ActionMusic.PLAY:
            play();
            break;
          case ActionMusic.PAUSE:
            pause();
            break;
          case ActionMusic.REWIND:
            rewind();
            break;
          case ActionMusic.FORWARD:
            forward();
            break;
          default:
            break;
        }
      },
    );
  }

  void configAudioPlayer() {
    audioPlayer = AudioPlayer();
    positionSubscription = audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
      if (position >= duree) {
        position = Duration(seconds: 0);
        // Passer à la musique suivante
      }
    });

    stateSubscription = audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.PLAYING) {
        setState(() {
          duree = audioPlayer.duration;
        });
      } else if (event == AudioPlayerState.STOPPED) {
        setState(() {
          status = PlayerState.STOPPED;
        });
      }
    }, onError: (message) {
      print(message);
      setState(() {
        status = PlayerState.STOPPED;
        duree = Duration(seconds: 0);
        position = Duration(seconds: 0);
      });
    });
  }

  Future play() async {
    await audioPlayer.play(actualMusic.musicUrl);
    setState(() {
      status = PlayerState.PLAYING;
    });
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() {
      status = PlayerState.PAUSED;
    });
  }

  Future muted() async {
    await audioPlayer.mute(!mute);
    setState(() {
      mute = !mute;
    });
  }

  void forward() {
    if (index == musique_list.length - 1) {
      index = 0;
    } else {
      index++;
    }
    actualMusic = musique_list[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }

  void rewind() {
    if (position > Duration(seconds: 3)) {
      audioPlayer.seek(0.0);
    } else {
      if (index == 0) {
        index = musique_list.length - 1;
      } else {
        index--;
      }
    }
    actualMusic = musique_list[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }

  String fromDuration(Duration duration) {
    return duration.toString().split('.').first;
  }
}

class PlayList5 extends StatefulWidget {
  PlayList5(
      {Key key,
      this.title,
      this.sliderHeight = 48,
      this.min = 0,
      this.max = 10,
      this.fullWidth = false})
      : super(key: key);
  final String title;
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;

  @override
  _PlayList5State createState() => _PlayList5State();
}

class _PlayList5State extends State<PlayList5> {
  double _value = 0;
  List<Musique> musique_list = [
    Musique('Heavy Heart', 'Kevin MacLeod', 'assets/images/5.png',
        'https://ia801901.us.archive.org/0/items/kevin-mac-leod-heavy-heart/KevinMacLeod-HeavyHeart.mp3'),
    Musique('Sleep', 'Scott Buckley', 'assets/images/5.png',
        'https://ia801404.us.archive.org/7/items/scott-buckley-sleep/ScottBuckley-Sleep.mp3'),
    Musique('Cherry Picking', 'Erothyme', 'assets/images/5.png',
        'https://ia803201.us.archive.org/20/items/erothyme-cherry-picking/Erothyme-CherryPicking.mp3'),
    Musique('Night', 'Cloudkicker', 'assets/images/5.png',
        'https://ia802803.us.archive.org/15/items/cloudkickernight/Cloudkicker_Night.mp3'),
  ];

  AudioPlayer audioPlayer;
  StreamSubscription positionSubscription;
  StreamSubscription stateSubscription;

  Musique actualMusic;
  Duration position = Duration(seconds: 0);
  Duration duree = Duration(seconds: 0);
  PlayerState status = PlayerState.STOPPED;
  int index = 0;
  bool mute = false;
  int maxVol = 0;
  int currentVol = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    actualMusic = musique_list[index];
    configAudioPlayer();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: AppColors.darkBlue,
        title: new Text(
          "HealMe",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'S',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 7,
                right: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Playing Now',
                    style: TextStyle(
                      fontFamily: 'S',
                      color: AppColors.styleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonWidget(
              image: actualMusic.imagePath,
              size: MediaQuery.of(context).size.width * .7,
              borderWidth: 5,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PlayList5(),
                  ),
                );
              },
            ),
            Text(
              actualMusic.titre,
              style: TextStyle(
                fontFamily: 'S',
                color: AppColors.styleColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
            Text(
              actualMusic.auteur,
              style: TextStyle(
                fontFamily: 'S',
                color: AppColors.styleColor.withAlpha(90),
                fontSize: 16,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.darkBlue,
                  inactiveTrackColor: AppColors.lightBlue,
                  overlayColor: AppColors.lightBlue,
                  activeTickMarkColor: Colors.white,
                  inactiveTickMarkColor: Colors.red.withOpacity(.7),
                ),
                child: Slider(
                    value: position.inSeconds.toDouble(),
                    min: 0.0,
                    max: duree.inSeconds.toDouble(),
                    onChanged: (double d) {
                      setState(() {
                        audioPlayer.seek(d);
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomButtonWidget(
                    size: 80,
                    onTap: () {
                      rewind();
                    },
                    child: Icon(
                      Icons.fast_rewind,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: (status != PlayerState.PLAYING) ? play : pause,
                    child: (status != PlayerState.PLAYING)
                        ? Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                    isActive: true,
                    borderWidth: 5,
                  ),
                  CustomButtonWidget(
                    size: 80,
                    onTap: forward,
                    child: Icon(
                      Icons.fast_forward,
                      color: AppColors.styleColor,
                    ),
                    borderWidth: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  /// Initialialiser le volume
  Future<void> initPlatformState() async {
    await Volume.controlVolume(AudioManager.STREAM_MUSIC);
  }

  /// Gestion des texte avec style
  Text textWithStyle(String data, double scale) {
    return Text(
      data,
      textScaleFactor: scale,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 15.0),
    );
  }

  /// Gestion des boutons
  IconButton boutton(IconData icone, double taille, ActionMusic action) {
    return IconButton(
      icon: Icon(icone),
      iconSize: taille,
      color: Colors.white,
      onPressed: () {
        switch (action) {
          case ActionMusic.PLAY:
            play();
            break;
          case ActionMusic.PAUSE:
            pause();
            break;
          case ActionMusic.REWIND:
            rewind();
            break;
          case ActionMusic.FORWARD:
            forward();
            break;
          default:
            break;
        }
      },
    );
  }

  void configAudioPlayer() {
    audioPlayer = AudioPlayer();
    positionSubscription = audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
      if (position >= duree) {
        position = Duration(seconds: 0);
        // Passer à la musique suivante
      }
    });

    stateSubscription = audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.PLAYING) {
        setState(() {
          duree = audioPlayer.duration;
        });
      } else if (event == AudioPlayerState.STOPPED) {
        setState(() {
          status = PlayerState.STOPPED;
        });
      }
    }, onError: (message) {
      print(message);
      setState(() {
        status = PlayerState.STOPPED;
        duree = Duration(seconds: 0);
        position = Duration(seconds: 0);
      });
    });
  }

  Future play() async {
    await audioPlayer.play(actualMusic.musicUrl);
    setState(() {
      status = PlayerState.PLAYING;
    });
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() {
      status = PlayerState.PAUSED;
    });
  }

  Future muted() async {
    await audioPlayer.mute(!mute);
    setState(() {
      mute = !mute;
    });
  }

  void forward() {
    if (index == musique_list.length - 1) {
      index = 0;
    } else {
      index++;
    }
    actualMusic = musique_list[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }

  void rewind() {
    if (position > Duration(seconds: 3)) {
      audioPlayer.seek(0.0);
    } else {
      if (index == 0) {
        index = musique_list.length - 1;
      } else {
        index--;
      }
    }
    actualMusic = musique_list[index];
    audioPlayer.stop();
    configAudioPlayer();
    play();
  }

  String fromDuration(Duration duration) {
    return duration.toString().split('.').first;
  }
}
