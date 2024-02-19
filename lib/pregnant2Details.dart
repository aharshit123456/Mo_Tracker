import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo_tracker/emailDetails.dart';
import 'package:mo_tracker/mainNav.dart';

class Pregnant2Detail extends StatefulWidget {
  const Pregnant2Detail(String string, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _pregnant2DetailsState();
}

class _pregnant2DetailsState extends State<Pregnant2Detail> {
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
                  'Do you plan to concieve a baby ?',
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
                  width: 350,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainNav()));
                    },
                    child: Text('Yes, I do.',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  )),
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              SizedBox(
                  width: 350,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainNav()));
                    },
                    child: Text('No, I don\'t',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  )),


            ],
          ),
        ),
      ),
    );
  }
}
