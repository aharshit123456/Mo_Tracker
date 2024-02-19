import 'package:flutter/material.dart';
import 'package:mo_tracker/splashScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://laaqzjxwdscjxodvwlnf.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxhYXF6anh3ZHNjanhvZHZ3bG5mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDgzNDgyNzcsImV4cCI6MjAyMzkyNDI3N30.JsRoSNA_nZt-I3GG8PN_6FfVX0YmbOJA6r_RLFV0HaI',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}
