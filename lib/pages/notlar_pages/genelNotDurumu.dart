import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okul_giris/service/service_ogrenci.dart';
import 'onayTakip.dart';

class SonYilNotlari extends StatefulWidget {
 String sifre;
 String kadi;
  SonYilNotlari({this.kadi,this.sifre});
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
  VeriTabani vt=new VeriTabani();
   cagir(){
   return  vt.g_DB;
  }
  initState(){
    // vt.kullaniciya_ozel_veriler(widget.kadi,widget.sifre);
  }
  @override
  Widget build(BuildContext context) {

  setState(() {
    // vt.kullaniciya_ozel_veriler(widget.kadi, widget.sifre);
    // vt.lesson_dataInf();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("SON YIL NOTLARI"),
        backgroundColor: Color.fromRGBO(20, 33, 61,1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10))),
      ),
       body:FutureBuilder(
         future: vt.kullaniciya_ozel_veriler(widget.kadi,widget.sifre),

         builder: (context,snap){
           if (snap.connectionState == ConnectionState.none &&
               snap.hasData == null) {
             //print('project snapshot data is: ${projectSnap.data}');
             return Container();
           }
           Future.delayed(Duration(seconds: 5),(){
           });
          return  FutureBuilder(
            future: vt.kullaniciya_ozel_veriler(widget.kadi,widget.sifre),
            builder: (context,listsnap){
              if (listsnap.connectionState == ConnectionState.none &&
                  listsnap.hasData == null) {
                //print('project snapshot data is: ${projectSnap.data}');
                return Container();
              }

              return Container(
                child: vt.adi!=null?SingleChildScrollView(
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
                      // rows: vt
                      rows: [
                        // vt.g_DB.first.keys.toString()
                        Satirlar(vt.g_DB.firstWhere((element) => element==element,orElse: null).toString(), "BAHAR", "Mühendislik Matematiği", "7", "90", "90", ""),
                        Satirlar("330453", "BAHAR", "Mobil Programlama", "4", "80", "90", ""),
                        Satirlar("330454", "BAHAR", "Programlama Dili", "4", "85", "93", "")
                      ],
                    ),
                  ),
                ):Center(child: CircularProgressIndicator()),
              );

            },
           );


         },
       ),

    );
  }
}


