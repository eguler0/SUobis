import 'dart:async';


import 'package:flutter/material.dart';
import 'package:okul_giris/pages/tum_girisler.dart';
import '../../main.dart';
import '../ogr_giris_ekrani.dart';


class girisEkrani extends StatefulWidget {
  @override
  _girisEkraniState createState() => _girisEkraniState();
}

class _girisEkraniState extends State<girisEkrani> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.of(context)
          .pushReplacement(
          MaterialPageRoute(builder: (context) =>TumGirisler()));
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