import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onayTakip.dart';

class SonYilNotlari extends StatefulWidget {
  @override
  _SonYilNotlariState createState() => _SonYilNotlariState();
}

class _SonYilNotlariState extends State<SonYilNotlari> {

  DataRow Satirlar(String metin,String metin2,String metin3,String metin4,String metin5,String metin6,
      String metin7){
    return DataRow(
      cells: [
          DataCell(Text(metin)),
          DataCell(Text(metin2)),
          DataCell(Text(metin3)),
          DataCell(Text(metin4)),
          DataCell(Text(metin5)),
          DataCell(Text(metin6)),
          DataCell(Text(metin7))
        ]);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SON YIL NOTLARI"),
        backgroundColor: Color.fromRGBO(20, 33, 61,1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10))),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              dividerThickness: 5,

              columns: [
                DataColumn(
                    label: Text(
                  "DERS KODU",
                  style: GoogleFonts.staatliches(
                      fontSize: 30,
                      backgroundColor: Colors.amber,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "YARI YIL",
                      style: GoogleFonts.staatliches(
                          fontSize: 30,
                          backgroundColor: Colors.blue,
                          fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "DERS ADI",
                      style: GoogleFonts.staatliches(
                          fontSize: 30,
                          backgroundColor: Colors.green,
                          fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "KREDİ (AKTS)",
                      style: GoogleFonts.staatliches(
                          fontSize: 30,
                          backgroundColor: Colors.cyan,
                          fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "VİZE",
                      style: GoogleFonts.staatliches(
                          fontSize: 30,
                          backgroundColor: Colors.amber,
                          fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "FİNAL",
                      style: GoogleFonts.staatliches(
                          fontSize: 30,
                          backgroundColor: Colors.red,
                          fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "BÜT",
                      style: GoogleFonts.staatliches(
                          fontSize: 30,
                          backgroundColor: Colors.limeAccent,
                          fontWeight: FontWeight.bold),
                )),
              ],
              rows: [

                Satirlar("330452", "BAHAR", "Mühendislik Matematiği", "7", "90", "90", ""),
                Satirlar("330453", "BAHAR", "Mobil Programlama", "4", "80", "90", ""),
                Satirlar("330454", "BAHAR", "Programlama Dili", "4", "85", "93", "")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabloYapisi extends StatefulWidget {
  String metin;
  String metin2;
  String metin3;
  String metin4;
  String metin5;
  String metin6;
  String metin7;

  TabloYapisi(
    String metin,
    String metin2,
    String metin3,
    String metin4,
  ) {
    this.metin = metin;
    this.metin2 = metin2;
    this.metin3 = metin3;
    this.metin4 = metin4;
    this.metin5 = metin5;
    this.metin6 = metin6;
    this.metin5 = metin7;
  }

  @override
  _TabloYapisiState createState() => _TabloYapisiState();
}

class _TabloYapisiState extends State<TabloYapisi> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
