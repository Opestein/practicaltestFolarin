import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakanowpracticaltest/src/UI/homeScreen.dart';
import 'package:wakanowpracticaltest/src/Utils/Assets.dart';
import 'package:wakanowpracticaltest/src/Utils/const.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WakanowTestApp',
      theme: buildThemeData(),
//          ThemeData(
//        primarySwatch: Colors.blue,
//        primaryColor: themeColor,
//      ),
      home: SplashScreen(),
    );
  }
}

ThemeData buildThemeData() {
  final baseTheme = ThemeData.light();

  return baseTheme.copyWith(
      primaryColor: themeColor, primaryColorLight: themeColor);
}

class SplashScreen extends StatefulWidget {
  @override
  State createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  bool isLoading = false;
  bool isLoggedIn = false;

  SharedPreferences sharedPreferences;
  String phone;

//  final GoogleSignIn googleSignIn = new GoogleSignIn();
//
//  void settings() async {
//    Firestore fireStore = Firestore();
//    await fireStore.settings(timestampsInSnapshotsEnabled: true);
//  }

//todo check for other instances
  internetConn(context) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          isSignedIn();
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('error while connecting'),
            duration: Duration(seconds: 5),
          ));
        }
      } on SocketException catch (_) {
        var _durations = new Duration(seconds: 1);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('error while connecting'),
          duration: Duration(seconds: 5),
        ));
        return new Timer(_durations, navigationPage);
//      print('error while connecting');
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          isSignedIn();
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('error while connecting'),
            duration: Duration(seconds: 5),
          ));
        }
      } on SocketException catch (_) {
        var _durations = new Duration(seconds: 1);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('error while connecting'),
          duration: Duration(seconds: 5),
        ));
        return new Timer(_durations, navigationPage);
        print('error while connecting');
      }
    } else {
      print('error while connecting');
      var _durations = new Duration(seconds: 1);
//      Scaffold.of(context).showSnackBar(SnackBar(
//        content: Text('error while connecting'),
//        duration: Duration(seconds: 5),
//      ));
      return new Timer(_durations, navigationPage);
      print('error while connecting');
    }
//
////    try{
////      final result = await InternetAddress.lookup('www.google.com');
////      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
////        isSignedIn();
////
////      }
////      else{
//////        Scaffold.of(context).showSnackBar(SnackBar(
//////          content: Text('error while connecting'),
//////          duration: Duration(seconds: 5),
//////        ));
////      }
////    } on SocketException catch (_){
////
////      var _durations = new Duration(seconds: 1);
//////      Scaffold.of(context).showSnackBar(SnackBar(
//////        content: Text('error while connecting'),
//////        duration: Duration(seconds: 5),
//////      ));
////      return new Timer(_durations, navigationPage);
////      print('error while connecting');
////    }
  }

  isSignedIn() async {
    sharedPreferences = await SharedPreferences.getInstance();

    var _duration = new Duration(seconds: 2);

    return new Timer(_duration, navigationPage);
  }

  Future checkFirstScreen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool _firstLaunch = (preferences.getBool("firstLaunch") ?? false);
    if (_firstLaunch) {
      isSignedIn();
    } else {
      preferences.setBool("firstLaunch", true);
//      Navigator.pushReplacement(context,
//          CupertinoPageRoute(builder: (context) => OnboardingScreen()));
    }
  }

//  void navigationPage() {
//    Navigator.pushReplacement(
//      context,
//      MaterialPageRoute(builder: (context) => OnboardingScreen()),
//    );
//  }
//
//  void navigationPageLoggedIn() {
//    Navigator.pushReplacement(
//      context,
//      MaterialPageRoute(builder: (context) => OnboardingScreen()),
//    );
//  }

  void navigationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
//    settings();
//    internetConn(context);
    checkFirstScreen();
  }

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//        statusBarColor: Colors.white,
//        systemNavigationBarColor: Colors.white,
//        systemNavigationBarDividerColor:
//            Colors.white //or set color with: Color(0xFF0000FF)
//        ));

    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Align(
//              alignment: Alignment.center,
              child: Image.asset(
                Assets.logo,
                width: mediaQuery.size.width * 0.5,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                Container(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.orange.shade800)),
                ),
                SizedBox(
                  height: safeAreaHeight(context, 1),
                ),
                Text(
                  'v1.0.1',
                  style: TextStyle(color: Colors.orange.shade800),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: safeAreaHeight(context, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
