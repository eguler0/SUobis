import 'package:flutter/material.dart';
import 'package:okul_giris/pages/ogr_giris_ekrani.dart';
import 'package:okul_giris/pages/akademisyen_pages/akademisyen_giris.dart';

import '../animation/FadeAnimation.dart';
class TumGirisler extends StatefulWidget {
  const TumGirisler({Key key}) : super(key: key);

  @override
  _TumGirislerState createState() => _TumGirislerState();
}

class _TumGirislerState extends State<TumGirisler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(1, Text("SU OBİS GİRİŞİNE HOŞGELDİNİZ", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),)),
                  SizedBox(height: 10,),
                  FadeAnimation(1.2, Text("Sizin için uygun olanı seçiniz.", style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700]
                  ),)),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(1.5, Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                      },
                      color: Colors.yellow,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text("ÖĞRENCİ GİRİŞİ", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),),
                    ),
                  )),
                ],
              ),
              FadeAnimation(1.5, Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )
                ),
                child: GestureDetector(
                  onDoubleTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AkademisyenGiris()));
                  },
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){},
                    color: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text("AKADEMİSYEN GİRİŞİ", style: TextStyle(
                      color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),),
                  ),
                ),
              )),
              FadeAnimation(1.6, Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Made by Compt.Eng", style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18
                  ),),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),),
        SizedBox(height: 5,),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}
