import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okul_giris/service/dosya_islemleri_service.dart';
import 'package:okul_giris/service/service_ogrenci.dart';
import '../main.dart';
import '../myWidgets/elevatedButton.dart';
import 'package:google_fonts/google_fonts.dart';
import '../myWidgets/slide_image.dart';
import 'ogr_giris_ekrani.dart';


class newPage extends StatefulWidget {
  String kadi;
  String sifre;
  newPage({this.kadi,this.sifre});

  @override
  _newPageState createState() => _newPageState();
}

class _newPageState extends State<newPage> {
  VeriTabani vt=new VeriTabani();
  final TextStyle textSinif = new TextStyle(
    color: Colors.white,
    fontSize: 20,

    //fontWeight: FontWeight.w400,
    //  fontStyle: FontStyle.italic
  );

@override
  void initState() {

   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 29, 61, 1),
          title: Container(
            padding: EdgeInsets.only(right: 50),
            alignment: Alignment.center,
            child: Text(
              "ANASAYFA",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )),
      drawer:FutureBuilder(
        future: vt.kullaniciya_ozel_veriler(this.widget.kadi,this.widget.sifre),
    builder: (context,listsnap){
    if (listsnap.connectionState == ConnectionState.none &&
    listsnap.hasData == null) {
    //print('project snapshot data is: ${projectSnap.data}');
    return Container();
    }
    return vt.adi==null?Center(child: CircularProgressIndicator()): new Drawer(

        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            UserAccountsDrawerHeader(
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  color: Color.fromRGBO(255, 183, 3, 1)),
              accountName: Text(
                vt.adi+vt.soyadi,
                style: TextStyle(color: Colors.black87),
              ),
              accountEmail: Text(
                vt.eposta,
                style: TextStyle(color: Colors.black87),
              ),
              currentAccountPicture:
              CircleAvatar(backgroundImage: NetworkImage(vt.resim_url)),
            ),
            Container(
              width: 400,
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(2, 48, 71, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
                    child: ElevatedButton1("Onay Takip", Icons.wysiwyg, 1,sifre: this.widget.sifre,kadi: this.widget.kadi,),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
                      child: ElevatedButton1("Son Yıl Notları", Icons.book, 2,sifre: this.widget.sifre,kadi: this.widget.kadi,)),
                  Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
                      child: ElevatedButton1("Not Durumu", Icons.assignment, 3,sifre: this.widget.sifre,kadi: this.widget.kadi)),
                  Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
                      child: ElevatedButton1("ORT GRAFİĞİ", Icons.graphic_eq_outlined, 12,kadi: this.widget.kadi,sifre: this.widget.sifre,)),
                  Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
                      child: ElevatedButton1("DUYURULAR", Icons.announcement, 4)),
                  Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
                      child: ElevatedButton1(
                          "HARÇ DURUMU", Icons.monetization_on, 5)),
                  Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
                      child:
                      ElevatedButton1("YKK KARARLARI", Icons.attach_file, 6,kadi: widget.kadi,sifre: widget.sifre,)),
                  Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
                      child:
                      ElevatedButton1("SINAV TARİHL.", Icons.calendar_today, 7)),
                  Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
                      child:
                      ElevatedButton1("UZEM DUYURU", Icons.calendar_today, 9)),
                  Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
                      child:
                      ElevatedButton1("\‘ Bugün Konya \’", Icons.cloud, 8)),
                  Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
                      child:
                      ElevatedButton1("Şifre Değiştir", Icons.cloud, 13,kadi: widget.kadi,sifre: widget.sifre,)),

                  Container(
                    padding: EdgeInsets.only(left: 15,top: 10),
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton.extended(label: Text("Çıkış"),icon: Icon(Icons.exit_to_app,color: Colors.white,size: 40,), onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                    }),
                  )
                ],
              ),
            )
          ],
        ));}),

      body:FutureBuilder(
        future: vt.kullaniciya_ozel_veriler(this.widget.kadi,this.widget.sifre),
        builder: (context,listsnap){
          if (listsnap.connectionState == ConnectionState.none &&
              listsnap.hasData == null) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Container();
          }
          return vt.adi==null?Center(child: CircularProgressIndicator()):Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(247, 255, 247, 1),
                      Color.fromRGBO(247, 255, 247, 1)
                    ])),
            child: IntrinsicHeight(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SlaytGecisi(),
                    Container(
                      child: Image.network(vt.resim_url),
                      margin: EdgeInsets.only(left: 60, right: 60),
                      width: 300,
                      height: 300,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 60, top: 10, right: 60),
                      // alignment: Alignment.topLeft,
                      //color: Colors.blue.shade50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                        border: TableBorder.all(
                            style: BorderStyle.solid,
                            width: 3,
                            color: Colors.black87),
                        children: [
                          TableRow(children: [
                            Container(
                              color: Color.fromRGBO(34, 34, 59, 1),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "ÖĞRENCİ NO:",
                                style: GoogleFonts.raleway(
                                    color: Colors.white, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  vt.Numara,
                                  style: GoogleFonts.raleway(
                                      color: Colors.black87, fontSize: 25),
                                  textAlign: TextAlign.left,
                                )),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "ADI-SOYADI:",
                                style: GoogleFonts.raleway(
                                    color: Colors.black87, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                color: Color.fromRGBO(34, 34, 59, 1),
                                child: Text(
                                  vt.adi+" "+vt.soyadi,
                                  style: GoogleFonts.raleway(
                                      color: Colors.white, fontSize: 25),
                                  textAlign: TextAlign.left,
                                )),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              color: Color.fromRGBO(34, 34, 59, 1),
                              child: Text(
                                "FAKÜLTE:",
                                style: GoogleFonts.raleway(
                                    color: Colors.white, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  vt.fakulte,
                                  style: GoogleFonts.raleway(
                                      color: Colors.black87, fontSize: 25),
                                  textAlign: TextAlign.left,
                                )),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "BÖLÜM:",
                                style: GoogleFonts.raleway(
                                    color: Colors.black87, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                color: Color.fromRGBO(34, 34, 59, 1),
                                child: Text(
                                  vt.bolum,
                                  style: GoogleFonts.raleway(
                                      color: Colors.white, fontSize: 25),
                                  textAlign: TextAlign.left,
                                )),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              color: Color.fromRGBO(34, 34, 59, 1),
                              child: Text(
                                "DANIŞMAN:",
                                style: GoogleFonts.raleway(
                                    color: Colors.white, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  vt.danisman,
                                  style: GoogleFonts.raleway(
                                      color: Colors.black87, fontSize: 25),
                                  textAlign: TextAlign.left,
                                )),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "E-POSTA:",
                                style: GoogleFonts.raleway(
                                    color: Colors.black87, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                color: Color.fromRGBO(34, 34, 59, 1),
                                child: Text(
                                  vt.eposta,
                                  style: GoogleFonts.raleway(
                                      color: Colors.white, fontSize: 25),
                                  textAlign: TextAlign.left,
                                )),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      )


    );
  }
}
