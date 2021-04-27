import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class notlar extends StatefulWidget {
  @override
  _notlarState createState() => _notlarState();
}

class _notlarState extends State<notlar> {
  double degree = 0.0;
  List<String> dersAdlari = [
    "Mobil",
    "Matematik",
    "Yazılm.Müh",
    "Veritabanı",
    "Ekoloji",
    "Matematik",
    "Yazılm.Müh",
    "Mantık Devreleri"
  ];

  Column hazirTablo(){

 return Column(

   crossAxisAlignment: CrossAxisAlignment.start,
   children: [
     Container(
       alignment: Alignment.centerLeft,
       padding: EdgeInsets.fromLTRB(5,40, 0, 0),

       child: Text("2019-2020 GÜZ YARIYILI",style: GoogleFonts.bebasNeue(fontSize: 40)),
     ),
     DataTable(
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
        "KATSAYI",
        style: GoogleFonts.staatliches(
        fontSize: 30,
        backgroundColor: Colors.cyan,
        fontWeight: FontWeight.bold),
        )),
        DataColumn(
        label: Text(
        "MUAF",
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
        Satirlar("330452", "BAHAR", "Mühendislik Matematiği", "7",
        "4,5", " ", "90", "90", ""),
        Satirlar("330453", "BAHAR", "Mobil Programlama", "4", "80",
        "4,5", " ", "90", ""),
        Satirlar("330454", "BAHAR", "Programlama Dili", "4", "85",
        "4,5", " ", "93", "")
        ],
        ),
     Container(
       color: Colors.limeAccent,
       padding: EdgeInsets.all(8),
       margin: EdgeInsets.only(),
       child: Text("2019-2020 BAHAR YARI YILI:$degree"),
     ),
   ],
 );
  }

  DataRow Satirlar(
      String metin,
      String metin2,
      String metin3,
      String metin4,
      String metin5,
      String metin6,
      String metin7,
      String metin8,
      String metin9) {
    return DataRow(cells: [
      DataCell(Text(metin)),
      DataCell(Text(metin2)),
      DataCell(Text(metin3)),
      DataCell(Text(metin4)),
      DataCell(Text(metin5)),
      DataCell(Text(metin6)),
      DataCell(Text(metin7)),
      DataCell(Text(metin8)),
      DataCell(Text(metin9))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    degree = 3.61;
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("NOT DURUMU"),
        backgroundColor: Color.fromRGBO(20, 33, 61,1),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10))),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                hazirTablo(),
                hazirTablo(),
                hazirTablo(),
                hazirTablo(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
