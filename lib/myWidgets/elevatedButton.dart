import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../pages/anaSayfa.dart';
import '../pages/genelNotDurumu.dart';
import '../pages/notlar.dart';
import '../pages/onayTakip.dart';
import '../pages/duyurular.dart';
import '../pages/sinav_tarihleri.dart';
import '../pages/ykkKararlari.dart';
import '../pages/harc_durumu.dart';

class ElevatedButton1 extends StatefulWidget {
  String metin = "";
  IconData ico;
  int signal=0;

  ElevatedButton1(String metin, IconData ico,int signal) {
    this.metin = metin;
    this.ico = ico;
    this.signal=signal;
  }

  @override
  ElevatedButton1State createState() => ElevatedButton1State();
}

class ElevatedButton1State extends State<ElevatedButton1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              primary: Color.fromRGBO(255, 179, 0, 1)),
          onPressed: () {
            setState(() {
              if(widget.signal==1){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnayTakip()),

                );

              }
              else if(widget.signal==2){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SonYilNotlari()),

                );

              }
              else if(widget.signal==3){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => notlar()),

                );
              }
              else if(widget.signal==4){
              Navigator.push(context,

              MaterialPageRoute(builder: (context)=>Duyurular()));
              }
              else if(widget.signal==5){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HarcDurumu()));
              }
              else if(widget.signal==6){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ykkKararlari()));
              }
              else if(widget.signal==7){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>sinavTarihleri()));
              }

            });

          },
          child: Text(
            widget.metin,
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 20),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 40),
            child: Container(
              alignment: Alignment.centerLeft,
                child: Icon(
              widget.ico,
              color: Colors.white,
              size: 40,
            )))
      ],
    );
  }
}
