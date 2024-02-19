import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class PeriodSaathi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _periodSaathiState();
}

class _periodSaathiState extends State<PeriodSaathi> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  void initState() {
    super.initState();
    startScan();
  }

  void startScan() {
    flutterBlue.startScan(timeout: Duration(seconds: 4));
  }

  void connectToDevice(BluetoothDevice device) async {
    await device.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color.fromRGBO(255, 148, 148, 1),
        child: Center(
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
                      'Find Period Saathi',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
