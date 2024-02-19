import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo_tracker/emailDetails.dart';
import 'package:mo_tracker/pregnant2Details.dart';

class PregnantDetail extends StatefulWidget {
  final int age;
  const PregnantDetail(this.age, {Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _pregnantDetailsState();
}




class _pregnantDetailsState extends State<PregnantDetail> {

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
                "Surekha",
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
                  'Are you pregnant ?',
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
                    onSubmitted: (String string){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Pregnant2Detail(string)));
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
                      hintText: 'Enter Yes or No ? :sobs:',
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
