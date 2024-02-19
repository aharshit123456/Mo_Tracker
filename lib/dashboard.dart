import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mo_tracker/periodSaathi.dart';
import 'package:numberpicker/numberpicker.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _dashboardState();
}

class _dashboardState extends State<Dashboard> {
  int _currentIntValue = 18 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color.fromRGBO(255, 148, 148, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'February',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black,
                      indent: 30,
                      endIndent: 30,
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Row(
                      children: [
                        NumberPicker(
                          selectedTextStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                          minValue: 1,
                          maxValue: 28,
                          value: _currentIntValue,
                          haptics: true,
                          onChanged: (value) =>
                              setState(() => _currentIntValue = value),
                        ),
                        Container(
                          padding: EdgeInsets.all(60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black,),
                          ),
                          child: Text('Log Period', style: TextStyle(color: Colors.black, fontSize: 30),),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Divider(
                      thickness: 2,
                      color: Colors.black,
                      indent: 30,
                      endIndent: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PeriodSaathi()));
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.message_rounded, color: Colors.black, size: 44,),
                            Padding(padding: EdgeInsets.all(8)),
                            Text('Connect with nearest Period Saathi', style: TextStyle(color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black,
                      indent: 30,
                      endIndent: 30,
                    ),
          
          
          
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 10, bottom: 10),
                  child: Text('My Cycles', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                ),
              ),
              Container(
                width: 300,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(241, 120,119, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cycle history', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                        Text('See all', style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.black54,
                      indent: 8,
                      endIndent: 8,
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 150,
                        child: Column(
                          children: [
                            Text('Cycle 1'),
                            Text('Cycle 1'),
                            Text('Cycle 1'),
                            Text('Cycle 1'),
                            Text('Cycle 1'),
                            Text('Cycle 1'),
                            Text('Cycle 1'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          
            ],
          ),
        ),
      ),
    );
  }
}
