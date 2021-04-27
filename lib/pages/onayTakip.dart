import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'anaSayfa.dart';

class OnayTakipStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}

class OnayTakip extends StatefulWidget {
  @override
  _OnayTakipState createState() => _OnayTakipState();
}

class _OnayTakipState extends State<OnayTakip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => newPage()),
                          );
                        })),
                Container(
                  child: Text(
                    "ONAY TAKİP TABLOSU",
                    style: GoogleFonts.merriweather(
                        fontSize: 20,
                        color: Colors.black,
                        ),
                  ),
                ),
                Container(color: Colors.amber,child: TabloMetni("YIL:", "DERS KODU: ", "ONAY DURUMU")),
                TabloMetni("2021", "3301452", "ONAYLANDI"),
                TabloMetni("2021", "3301453", "ONAYLANDI"),
                TabloMetni("2021", "3301454", "ONAYLANDI"),
                TabloMetni("2021", "3301455", "ONAYLANDI"),
                TabloMetni("2021", "3301456", "ONAYLANDI"),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "DERS-GÖREVLİ TABLOSU",
                      style: GoogleFonts.merriweather(
                          fontSize: 20,
                          color: Colors.black,
                          ),
                    ),
                  ),
                ),
                Container(color: Colors.amber ,child: TabloMetni("DERS KODU:", "DERS ADI:", "GÖREVLİ")),
                TabloMetni("3301452", "Prog.Dili-2", "TAHİR SAĞ"),
                TabloMetni("3301453", "Mantık Devr.-2", "Fatih Başçiftçi"),
                TabloMetni("3301454", "Veritabanı.Y.S", "İ.Ali Özkan"),
                TabloMetni("3301455", "Yaz.Müh.Giriş", "Alpaslan Altun"),
                TabloMetni("3301456", "Mobil Programlama", "A.Cevahir Çınar"),
              ]),
            )),
      ),
    );
  }
}

class TabloMetni extends StatefulWidget {
  String metin = "";
  String metin2 = "";
  String metin3 = "";
  String metin4 = "";
  String metin5 = "";
  String metin6 = "";

  TabloMetni(String metin, String metin2, String metin3,[String metin4, String metin5, String metin6]) {
    this.metin = metin;
    this.metin2 = metin2;
    this.metin3 = metin3;
    this.metin4 = metin4;
    this.metin5 = metin5;
    this.metin6 = metin6;
  }



  @override
  TabloMetniState createState() => TabloMetniState();
}

class TabloMetniState extends State<TabloMetni> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Table(
          border: TableBorder.all(
              style: BorderStyle.solid, width: 3.2, color: Color.fromRGBO(34, 34, 59, 1)),
          children: [
            TableRow(
              children: [
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.metin,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.metin2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.metin3,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
