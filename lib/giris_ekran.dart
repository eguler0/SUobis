import 'dart:async';

// import 'package:main.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class girisEkrani extends StatefulWidget {
  @override
  _girisEkraniState createState() => _girisEkraniState();
}

class _girisEkraniState extends State<girisEkrani> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.of(context)
          .pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0,20,34,1),
        body: Center(
          child: Image.asset('assets/first.gif', width: MediaQuery
              .of(context)
              .size
              .width, height:MediaQuery.of(context).size.height, fit: BoxFit.fitWidth,),
        ),
      ),
    );
  }
}