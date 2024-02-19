import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeatControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _heatControlState();
}

class _heatControlState extends State<HeatControl> {
  bool On = true;
  double _currentSliderValue = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color.fromRGBO(255, 148, 148, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Connect Devices',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Row(),
              SizedBox(height: 200),
              On
                  ? FilledButton(
                      onPressed: () {
                        setState(() {
                          On = !On;
                        });
                      },
                      child: SizedBox(
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Turn On'),
                                Icon(Icons.check_box_outline_blank_outlined)
                              ]),
                        ),
                      ))
                  : FilledButton(
                      onPressed: () {
                        setState(() {
                          On = !On;
                        });
                      },
                      child: SizedBox(
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Turn Off'),
                                Icon(
                                  Icons.check_box_rounded,
                                  color: Colors.green,
                                )
                              ]),
                        ),
                      )),
              SizedBox(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: Text('Low'),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: Text('Med'),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: Text('High'),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 300,
              child: Slider(value: _currentSliderValue, onChanged: (double value){setState(() {
                _currentSliderValue = value ;
              });}, min: 0, max: 100,)

              )
            ],
          ),
        ),
      ),
    );
  }
}
