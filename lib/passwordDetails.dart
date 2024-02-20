import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo_tracker/ageDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PasswordDetail extends StatefulWidget {
  final String emailAddress;
  final String name;

  const PasswordDetail(this.emailAddress, this.name, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _passwordDetailsState();
}

class _passwordDetailsState extends State<PasswordDetail> {
  Future<void> signUpNewUser(String password) async {
    if (!isValidEmail(widget.emailAddress)) {
      print('Invalid email format');
      print(widget.emailAddress);
      return;
    }

    final AuthResponse res = await Supabase.instance.client.auth.signUp(
      email: widget.emailAddress,
      password: password,
    );

    //print(res.toString());

    final AuthResponse res2 =
        await Supabase.instance.client.auth.signInWithPassword(
      email: widget.emailAddress,
      password: password,
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('user', res2.user.toString());
  }

  /*
  Section copied.
   */
  bool isValidEmail(String email) {
    // Simple email format validation using regular expression
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromRGBO(246, 204, 169, 1),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              SizedBox(height: 16),
              Text(
                widget.name + ",",
                style: TextStyle(
                  fontFamily: "Gothic A1",
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(119, 32, 32, 1),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'Please enter your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    color: Color.fromRGBO(119, 32, 32, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 250,
              ),
              SizedBox(
                  width: 300,
                  child: TextField(
                    onSubmitted: (String password) {
                      setState(() {
                        signUpNewUser(password);
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Kindly verify your email before proceeding forward'),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AgeDetail(widget.name)));
                      });
                    },
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(51)),
                      suffixIcon: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                      hintText: 'Enter a new Password',
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
