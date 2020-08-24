import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:diagnostic_app/model/User.dart';
import 'package:diagnostic_app/ui/home/HomeScreen.dart';
import 'package:diagnostic_app/ui/services/Authenticate.dart';
import 'package:diagnostic_app/ui/utils/helper.dart';
import 'package:diagnostic_app/model/Car.dart';
import 'package:diagnostic_app/model/Prestation.dart';
import 'constants.dart' as Constants;
import 'ui/auth/AuthScreen.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static User currentUser;
  static User client;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(Constants.COLOR_PRIMARY_DARK)));
    return MaterialApp(
        theme: ThemeData(accentColor: Color(Constants.COLOR_PRIMARY)),
        debugShowCheckedModeBanner: false,
        color: Color(Constants.COLOR_PRIMARY),
        home: OnBoarding());
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}
}

class OnBoarding extends StatefulWidget {
  @override
  State createState() {
    return OnBoardingState();
  }
}

class OnBoardingState extends State<OnBoarding> {
  Future hasFinishedOnBoarding() async {
    FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null) {
      User user = await FireStoreUtils().getCurrentUser(firebaseUser.uid);
      if (user != null) {
        MyAppState.currentUser = user;
        pushReplacement(context, new HomeScreen(user: user));
      } else {
        pushReplacement(context, new AuthScreen());
      }
    } else {
      pushReplacement(context, new AuthScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    hasFinishedOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.COLOR_PRIMARY),
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
