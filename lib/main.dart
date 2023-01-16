import 'package:bloclearneaxmpletwo/HomePage.dart';
import 'package:flutter/material.dart';


void main(){runApp(MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Salaray Controll',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
