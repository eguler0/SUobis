import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sinavTarihleri extends StatefulWidget {
  @override
  _sinavTarihleriState createState() => _sinavTarihleriState();
}

class _sinavTarihleriState extends State<sinavTarihleri> {
  Column hazirTablo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
          child: Text("TARİHLER", style: GoogleFonts.bebasNeue(fontSize: 40)),
        ),
        DataTable(
          dividerThickness: 5,
          columns: [
            DataColumn(
                label: Text(
              "YIL",
              style: GoogleFonts.staatliches(
                  fontSize: 30,
                  backgroundColor: Colors.amber,
                  fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "DERS NO",
              style: GoogleFonts.staatliches(
                  fontSize: 30,
                  backgroundColor: Colors.blue,
                  fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "ADI",
              style: GoogleFonts.staatliches(
                  fontSize: 30,
                  backgroundColor: Colors.green,
                  fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "ŞUBE",
              style: GoogleFonts.staatliches(
                  fontSize: 30,
                  backgroundColor: Colors.cyan,
                  fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "VİZE SAYISI",
              style: GoogleFonts.staatliches(
                  fontSize: 30,
                  backgroundColor: Colors.cyan,
                  fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "VİZE1 TARİHİ",
              style: GoogleFonts.staatliches(
                  fontSize: 30,
                  backgroundColor: Colors.cyan,
                  fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "VİZE2 TARİHİ",
              style: GoogleFonts.staatliches(
                  fontSize: 30,
                  backgroundColor: Colors.amber,
                  fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "FİNAL TARİHİ",
              style: GoogleFonts.staatliches(
                  fontSize: 30,
                  backgroundColor: Colors.red,
                  fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "BÜTÜNLEME TARİHİ",
              style: GoogleFonts.staatliches(
                  fontSize: 30,
                  backgroundColor: Colors.limeAccent,
                  fontWeight: FontWeight.bold),
            )),
          ],
          rows: [
            Satirlar(
                "2021",
                "3301351",
                "NESNEYE YÖNELİK PROGRAMLAMA DİLİ	",
                "0",
                "1",
                "20.12.2020 23:59:00	",
                "90",
                "25.1.2021 18:00:00",
                "10.2.2021 10:00:00"),
            Satirlar(
                "2021",
                "3301352",
                "İŞLETİM SİSTEMLERİ",
                "0",
                "1",
                "20.12.2020 23:59:00	",
                "90",
                "26.1.2021 18:00:00",
                "12.2.2021 10:00:00"),
            Satirlar(
                "2021",
                "3301353",
                "MÜHENDİSLİK MATEMATİĞİ",
                "0",
                "1",
                "20.12.2020 23:59:00	",
                "90",
                "27.1.2021 18:00:00",
                "13.2.2021 10:00:00"),
            Satirlar(
                "2021",
                "3301351",
                "NESNEYE YÖNELİK PROGRAMLAMA DİLİ	",
                "0",
                "1",
                "20.12.2020 23:59:00	",
                "90",
                "25.1.2021 18:00:00",
                "10.2.2021 10:00:00"),
            Satirlar(
                "2021",
                "3301352",
                "İŞLETİM SİSTEMLERİ",
                "0",
                "1",
                "20.12.2020 23:59:00	",
                "90",
                "26.1.2021 18:00:00",
                "12.2.2021 10:00:00"),
            Satirlar(
                "2021",
                "3301353",
                "MÜHENDİSLİK MATEMATİĞİ",
                "0",
                "1",
                "20.12.2020 23:59:00	",
                "90",
                "27.1.2021 18:00:00",
                "13.2.2021 10:00:00"),
            Satirlar(
                "2021",
                "3301351",
                "NESNEYE YÖNELİK PROGRAMLAMA DİLİ	",
                "0",
                "1",
                "20.12.2020 23:59:00	",
                "90",
                "25.1.2021 18:00:00",
                "10.2.2021 10:00:00"),
            Satirlar(
                "2021",
                "3301352",
                "İŞLETİM SİSTEMLERİ",
                "0",
                "1",
                "20.12.2020 23:59:00	",
                "90",
                "26.1.2021 18:00:00",
                "12.2.2021 10:00:00"),
            Satirlar(
                "2021",
                "3301353",
                "MÜHENDİSLİK MATEMATİĞİ",
                "0",
                "1",
                "20.12.2020 23:59:00	",
                "90",
                "27.1.2021 18:00:00",
                "13.2.2021 10:00:00"),
          ],
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(41, 50, 65, 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        title: Text(
          "SINAV TARİHLERİ",
          style: GoogleFonts.robotoSlab(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: hazirTablo(),
          ),
        ),
      ),
    );
  }
}
