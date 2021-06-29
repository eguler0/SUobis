import 'package:flutter/material.dart';
import 'package:okul_giris/service/service_akademisyen.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class Expansion_Panel extends StatefulWidget {
  Set<String> dizi=new Set<String>();
  String kadi;
  String sifre;
  Expansion_Panel(this.kadi,this.sifre,this.dizi,{Key key}) : super(key: key);

  @override
  _Expansion_PanelState createState() => _Expansion_PanelState();
}


// ...
int uzunluk;
int sayac=0;

class _Expansion_PanelState extends State<Expansion_Panel> {
  Akademisyen_VeriTabani akvt = new Akademisyen_VeriTabani();

  @override
  Widget build(BuildContext context) {
    


  }

}