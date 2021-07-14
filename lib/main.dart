import 'package:flutter/material.dart';
import 'package:movegro/UI/Screen/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
