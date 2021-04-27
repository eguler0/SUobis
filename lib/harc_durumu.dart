import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class HarcDurumu extends StatefulWidget {
  DataRow Satirlar(int deger1, String metin2, int deger3, String metin4,
      String metin5,) {
    return DataRow(cells: [
      DataCell(Text(deger1.toString())),
      DataCell(Text(metin2)),
      DataCell(Text(deger3.toString())),
      DataCell(Text(metin4)),
      DataCell(Text(metin5))
    ]);
  }

  @override
  _HarcDurumuState createState() => _HarcDurumuState();
}

class _HarcDurumuState extends State<HarcDurumu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HARÇ DURUMU"),backgroundColor: Color.fromRGBO(20, 33, 61,1),),
      body: IntrinsicHeight(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              child: DataTable(
                dividerThickness: 5,

                columns: [
                  DataColumn(
                      label: Text(
                        "DÖNEM",
                        style: GoogleFonts.staatliches(
                            fontSize: 30,
                            backgroundColor: Colors.amber,
                            fontWeight: FontWeight.bold),
                      )),
                  DataColumn(
                      label: Text(
                        "HARÇ DURUMU",
                        style: GoogleFonts.staatliches(
                            fontSize: 30,
                            backgroundColor: Colors.blue,
                            fontWeight: FontWeight.bold),
                      )),
                  DataColumn(
                      label: Text(
                        "MİKTAR",
                        style: GoogleFonts.staatliches(
                            fontSize: 30,
                            backgroundColor: Colors.green,
                            fontWeight: FontWeight.bold),
                      )),
                  DataColumn(
                      label: Text(
                        "TAHAKKUK TARİHİ",
                        style: GoogleFonts.staatliches(
                            fontSize: 30,
                            backgroundColor: Colors.cyan,
                            fontWeight: FontWeight.bold),
                      )),
                  DataColumn(
                      label: Text(
                        "ÖDEME TARİHİ",
                        style: GoogleFonts.staatliches(
                            fontSize: 30,
                            backgroundColor: Colors.amber,
                            fontWeight: FontWeight.bold),
                      )),

                ],
                rows: [
                widget.Satirlar(1, "NORMAL ÖĞRETİM ÜCRETSİZ", 0, "21.8.2019 01:34:36","21.8.2019 01:34:36"),
                widget.Satirlar(1, "NORMAL ÖĞRETİM ÜCRETSİZ", 0, "21.8.2019 01:34:36","21.8.2019 01:34:36"),
                widget.Satirlar(1, "NORMAL ÖĞRETİM ÜCRETSİZ", 0, "21.8.2019 01:34:36","21.8.2019 01:34:36"),
                widget.Satirlar(1, "NORMAL ÖĞRETİM ÜCRETSİZ", 0, "21.8.2019 01:34:36","21.8.2019 01:34:36"),

                ],
              ),
          ),
        ),
      ),
    );
  }
}
