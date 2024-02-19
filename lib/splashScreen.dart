import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo_tracker/dashboard.dart';
import 'package:mo_tracker/mainNav.dart';
import 'package:mo_tracker/nameDetails.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _splashScreen();
}

class _splashScreen extends State<Splash> {
  void initState() {
    super.initState();


    Timer(
      Duration(seconds: 5),
      () => pushPage()
    );
  }



  void pushPage() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    final session = sharedPreferences.getString('user');

    if (session != null){
      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRight, child: MainNav()));
    }else{
      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.leftToRight, child: NameDetail()));

    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness
          .dark,
    ));

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromRGBO(119, 32, 32, 1),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  children: [
                    Image(image: AssetImage("assets/logo.png"),height: 100, width: 100),
                    SizedBox(height: 16),
                    Text(
                      "Mo Tracker",
                      style: TextStyle(
                        fontFamily: "Gothic A1",
                        fontSize: 24,
                        color: Color.fromRGBO(246, 204, 169, 1),
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
}
