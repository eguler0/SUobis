import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okul_giris/service/service_ogrenci.dart';

class ykkKararlari extends StatefulWidget {
  String kadi;
  String sifre;
  ykkKararlari(this.kadi, this.sifre);

  @override
  _ykkKararlariState createState() => _ykkKararlariState();
}

class _ykkKararlariState extends State<ykkKararlari> {
  int ogr_no = 193301061;
  String ogr_adi = "ENES GÜLER";
  VeriTabani vt=new VeriTabani();
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
      body: FutureBuilder(
        future: vt.kullaniciya_ozel_veriler(this.widget.kadi,this.widget.sifre),
    builder: (context,listsnap){
          debugPrint(widget.kadi);
    if (listsnap.connectionState == ConnectionState.none &&
    listsnap.hasData == null) {
    //print('project snapshot data is: ${projectSnap.data}');
    return Container();
    }
    return  vt.Numara!=null?IntrinsicHeight(
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
                    "Öğrenci No: ${widget.kadi}  Adı Soyadı:${vt.adi==null?"Loading":vt.adi} ${vt.soyadi==null?"Loading":vt.soyadi}",
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
    ):Center(child: CircularProgressIndicator(),);
        })




    );
  }
}
