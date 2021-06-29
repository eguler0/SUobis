import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okul_giris/main.dart';
import 'package:okul_giris/service/service_ogrenci.dart';
import '../anaSayfa.dart';

class OnayTakipStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}

class OnayTakip extends StatefulWidget {
  String sifre;
  String kadi;

  OnayTakip({this.kadi, this.sifre});

  @override
  _OnayTakipState createState() => _OnayTakipState();
}

VeriTabani vt = new VeriTabani();

class _OnayTakipState extends State<OnayTakip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            FutureBuilder(
                future: vt.Ders_Onay_Tablosu(widget.kadi),
                builder: (context, listsnap) {
                  if (listsnap.connectionState == ConnectionState.none &&
                      listsnap.hasData == null) {
                    //print('project snapshot data is: ${projectSnap.data}');
                    return Container();
                  }


                  return vt.onay_TakipListesi.isNotEmpty==true? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                      icon: Icon(Icons.arrow_back_ios),
                                      onPressed: () {
                                        vt.ders_Gorevli_Mapi.clear();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => newPage(
                                                kadi: this.widget.kadi,
                                                sifre: this.widget.sifre,
                                              )),
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
                              Container(
                                  color: Colors.amber,
                                  child: TabloMetni(
                                      "YIL:", "DERS KODU: ", "ONAY DURUMU")),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: (100.0 * 2),
                                child: ListView.builder(
                                    itemCount: vt.ders_kodlari.length,
                                    itemBuilder: (context, index) {

                                      return TabloMetni(
                                          vt.onay_TakipListesi
                                              .elementAt(index)["yil"]==null?"loading":vt.onay_TakipListesi
                                              .elementAt(index)["yil"],
                                          vt.ders_kodlari.elementAt(index)==null?"loading":vt.ders_kodlari.elementAt(index),
                                          vt.onay_TakipListesi
                                              .elementAt(index)["onay_durumu"]==null?"loading":vt.onay_TakipListesi
                                              .elementAt(index)["onay_durumu"]);
                                    }),
                              ),
                              // TabloMetni("2021", "3301452", "ONAYLANDI"),
                              // TabloMetni("2021", "3301453", "ONAYLANDI"),
                              // TabloMetni("2021", "3301454", "ONAYLANDI"),
                              // TabloMetni("2021", "3301455", "ONAYLANDI"),
                              // TabloMetni("2021", "3301456", "ONAYLANDI"),
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
                              Container(
                                  color: Colors.amber,
                                  child: TabloMetni(
                                      "DERS KODU:", "DERS ADI:", "GÖREVLİ")),

                            ]),
                          ),
                        )),
                  ):Center(child: CircularProgressIndicator(),);



                }),
              FutureBuilder(future: vt.Ders_Gorevli_Tablosu(),builder:(context,snap){
                if (snap.connectionState == ConnectionState.none &&
                    snap.hasData == null) {
                  //print('project snapshot data is: ${projectSnap.data}');
                  return Container();
                }
                return vt.ders_Gorevli_Mapi!=null? Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: (100.0*2),
                      child: ListView.builder(itemCount: vt.ders_Gorevli_Mapi.length,itemBuilder: (context,index){
                        return TabloMetni(vt.ders_kodlari.elementAt(index), vt.ders_Gorevli_Mapi.elementAt(index)["ders_adi"], vt.ders_Gorevli_Mapi.elementAt(index)["hoca_adi"]);
                      }),
                    )
                  ],
                ):Center(child: CircularProgressIndicator(),);
              } )
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: (100.0*2),
            //   child: ListView.builder(itemCount: 2,itemBuilder: (context,index){
            //     return TabloMetni("3301452", "Prog.Dili-2", "TAHİR SAĞ");
            //   }),
            // )

            // TabloMetni(
            //     "3301453", "Mantık Devr.-2", "Fatih Başçiftçi"),
            // TabloMetni(
            //     "3301454", "Veritabanı.Y.S", "İ.Ali Özkan"),
            // TabloMetni(
            //     "3301455", "Yaz.Müh.Giriş", "Alpaslan Altun"),
            // TabloMetni("3301456", "Mobil Programlama",
            //     "A.Cevahir Çınar"),
          ],
        ));
  }
}

class TabloMetni extends StatefulWidget {
  String metin = "";
  String metin2 = "";
  String metin3 = "";
  String metin4 = "";
  String metin5 = "";
  String metin6 = "";

  TabloMetni(
    this.metin,
    this.metin2,
    this.metin3, {
        this.metin4,
        this.metin5,
        this.metin6,
      }) {}

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
              style: BorderStyle.solid,
              width: 3.2,
              color: Color.fromRGBO(34, 34, 59, 1)),
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
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )),
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.metin3,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                        fontSize: 16, fontWeight: FontWeight.bold),
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
