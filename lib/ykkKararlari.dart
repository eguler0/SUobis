import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ykkKararlari extends StatefulWidget {
  @override
  _ykkKararlariState createState() => _ykkKararlariState();
}

class _ykkKararlariState extends State<ykkKararlari> {
  int ogr_no = 193301061;
  String ogr_adi = "ENES GÜLER";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        title: Text("YÖNETİM KURULU KARARLARI"),
        backgroundColor: Color.fromRGBO(20, 33, 61, 1),
      ),
      body: IntrinsicHeight(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //margin: EdgeInsets.only(right: 20),
                  color: Colors.blue.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Öğrenci No: $ogr_no  Adı Soyadı:$ogr_adi",
                      style: GoogleFonts.merriweather(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 24, 8, 8),
                    child: Text(
                      "Yönetim Kurulu Kararları Listesi",
                      style: GoogleFonts.merriweather(
                          fontSize: 20, backgroundColor: Colors.blue.shade800),
                    ),
                  ),
                ),
                DataTable(dividerThickness: 5, columns: [
                  DataColumn(
                      label: Text(
                    "DOSYA ADI",
                    style: GoogleFonts.staatliches(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "PDF ERİŞİM",
                    style: GoogleFonts.staatliches(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "Dosya Boyutu",
                    style: GoogleFonts.staatliches(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )),
                  DataColumn(
                      label: Text(
                    "TARİHİ",
                    style: GoogleFonts.staatliches(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )),
                ], rows: [
                  DataRow(cells: [
                    DataCell(
                      Text(""),
                    ),
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text(""))
                  ])
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
