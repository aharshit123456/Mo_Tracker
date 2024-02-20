import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mo_tracker/emailDetails.dart';
import 'package:mo_tracker/pregnantDetails.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AgeDetail extends StatefulWidget {
  final String name;
  const AgeDetail(this.name, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ageDetailsState();
}

Future<void> createDatabaseEntry(int age, String name) async {
  final session = Supabase.instance.client.auth.currentSession!;
  final email = session.user.email;
  print("$email  $age  $name");

  final res3 = await Supabase.instance.client.from('users').insert([
    {
      'email': session.user.email,
      'age': age,
      'name': name,
    }
  ]).execute();

  print('Database insert error: ${res3.toString()}');

}


class _ageDetailsState extends State<AgeDetail> {
  int? _selectedAge = 18; // Default age

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
                  'Please enter your age',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    color: Color.fromRGBO(119, 32, 32, 1),
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  padding: EdgeInsets.only(top: 60),
                  style: TextStyle(
                    color: Color.fromRGBO(119, 32, 32, 1),
                    fontSize: 36,
                  ),
                  value: _selectedAge,
                  onChanged: (int? newValue) {
                    setState(() {
                      _selectedAge = newValue;
                    });
                  },
                  items: List.generate(
                    100,
                    (index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
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
                    onPressed: () async {
                      int? age;
                      age = _selectedAge ;
                      await createDatabaseEntry(age!, widget.name);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PregnantDetail(age!)));
                    },
                    child: Text(
                      'Next',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
