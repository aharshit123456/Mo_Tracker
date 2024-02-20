import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo_tracker/emailDetails.dart';
import 'package:mo_tracker/passwordDetails.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EmailDetail extends StatefulWidget {
  final String name;
  const EmailDetail(this.name, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _emailDetailsState();
}

// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//
//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );
//
//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

class _emailDetailsState extends State<EmailDetail> {
  bool linevis = true;
  int nextBtnPressed = 0;

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
                  'Please enter your email',
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
                    onSubmitted: (String email){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordDetail(email, widget.name)));
                      });
                    },
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    obscureText: false,
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
                      hintText: 'Enter Email Address',
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
