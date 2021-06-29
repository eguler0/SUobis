import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:okul_giris/pages/akademisyen_pages/akad_sifre_degistir.dart';
import 'package:okul_giris/pages/akademisyen_pages/akademisyen_not_ekle.dart';
import 'package:okul_giris/pages/notlar_pages/genel_not_durumu.dart';
import 'package:okul_giris/pages/duyurular_pages/genel_duyurular.dart';
import 'package:okul_giris/pages/drawer_pages/ogr_sifre_degistir.dart';
import 'package:okul_giris/pages/drawer_pages/not_ort_durumu_grafik.dart';
import 'package:okul_giris/pages/drawer_pages/weather_page.dart';
import '../pages/anaSayfa.dart';
import '../pages/notlar_pages/genelNotDurumu.dart';
import '../pages/notlar_pages/notlar.dart';
import '../pages/drawer_pages/onayTakip.dart';
import '../pages/duyurular_pages/duyurular.dart';
import '../pages/drawer_pages/sinav_tarihleri.dart';
import '../pages/drawer_pages/ykkKararlari.dart';
import '../pages/drawer_pages/harc_durumu.dart';

class ElevatedButton1 extends StatefulWidget {
  String metin = "";
  IconData ico;
  int signal = 0;
  String sifre;
  String kadi;

  ElevatedButton1(String metin, IconData ico, int signal,
      {this.kadi, this.sifre}) {
    this.metin = metin;
    this.ico = ico;
    this.signal = signal;
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
              if (widget.signal == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OnayTakip(
                          kadi: this.widget.kadi, sifre: this.widget.sifre)),
                );
              } else if (widget.signal == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Notlar(
                          kadi: this.widget.kadi, sifre: this.widget.sifre)),
                );
              } else if (widget.signal == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Donem_Notlari(
                          sifre: widget.sifre,kadi: widget.kadi,)),
                );
              } else if (widget.signal == 4) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Duyurular()));
              } else if (widget.signal == 5) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HarcDurumu()));
              } else if (widget.signal == 6) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ykkKararlari(widget.kadi,widget.sifre)));
              } else if (widget.signal == 7) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sinavTarihleri()));
              } else if (widget.signal == 8) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WeatherPage()));
              } else if (widget.signal == 9) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Uzem_Duyurular()));
              } else if (widget.signal == 10) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NotEkle(kadi: this.widget.kadi,sifre: this.widget.sifre,)));
              } else if (widget.signal == 11) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SifreDegistir(kadi: widget.kadi,sifre: widget.sifre,)));
              }else if (widget.signal == 12) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NotDurumuGrafik(widget.kadi,widget.sifre)));
              }else if (widget.signal == 13) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OgrenciSifreDegistir(kadi:widget.kadi,sifre:widget.sifre)));
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
