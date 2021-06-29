import 'dart:async';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okul_giris/myWidgets/elevatedButton.dart';
import 'package:okul_giris/myWidgets/expansion_panel.dart';
import 'package:okul_giris/pages/akademisyen_pages/akademisyen_giris.dart';
import 'package:okul_giris/service/service_akademisyen.dart';

import '../ogr_giris_ekrani.dart';

class AkademisyenAnaSayfasi extends StatefulWidget {
  String kadi;
  String sifre;
  String value = "";
  String value2 = "";

  AkademisyenAnaSayfasi({Key key, this.kadi, this.sifre}) : super(key: key);

  @override
  _AkademisyenAnaSayfasiState createState() => _AkademisyenAnaSayfasiState();
}

class _AkademisyenAnaSayfasiState extends State<AkademisyenAnaSayfasi> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Akademisyen_VeriTabani akvt = new Akademisyen_VeriTabani();

  String dropdownValue = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 215, 64, 1),
          title: Text("Akademisyen "),
          centerTitle: true,
          // IconButton(
          //   icon: Icon(Icons.arrow_back_ios),
          //   onPressed: () {
          //     Akademisyen_VeriTabani akvt = new Akademisyen_VeriTabani();
          //     akvt.firestore_akademisyen.disableNetwork();
          //     Future.delayed(Duration(milliseconds: 1500), () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => AkademisyenGiris()));
          //     });
          //   },
          // ),
        ),
        drawer: FutureBuilder(
            future: akvt.veriCek_Akademisyen(widget.kadi, widget.sifre),
            builder: (context, listsnap) {
              if (listsnap.connectionState == ConnectionState.none &&
                  listsnap.hasData == null) {
                //print('project snapshot data is: ${projectSnap.data}');
                return Container();
              }
              return akvt.akad_Adi == null
                  ? Center(child: CircularProgressIndicator())
                  : new Drawer(

                      child: ListView(children: [
                        UserAccountsDrawerHeader(
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              color: Color.fromRGBO(255, 183, 3, 1)),
                          currentAccountPicture: CircleAvatar(
                            radius: 100,
                            backgroundImage: NetworkImage(akvt.resim_url),
                          ),
                          accountName:
                              Text(akvt.akad_Adi + " " + akvt.akad_Soyadi),
                          accountEmail: Text(akvt.mail_Akad),
                        ),
              Container(
              width: 400,
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(2, 48, 71, 1),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton1("Not ekle",Icons.event_note,10,kadi: widget.kadi,sifre: widget.sifre,),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton1("Şifreni Değiştir",Icons.vpn_key,11),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15,top: 10),
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton.extended(label: Text("Çıkış"),icon: Icon(Icons.exit_to_app,color: Colors.white,size: 40,), onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AkademisyenGiris()));
                  }),
                )
              ])),

                      ]),
                    );
            }),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: akvt.veriCek_Akademisyen(widget.kadi, widget.sifre),
              builder: (context, listsnap) {
                if (listsnap.connectionState == ConnectionState.none &&
                    listsnap.hasData == null) {
                  //print('project snapshot data is: ${projectSnap.data}');
                  return Container();
                }
               return akvt.resim_url!=null? FutureBuilder(
                    future: akvt.OgrenimBilgisiCek(akvt.kadi_Akad),
                    builder: (context, listsnap) {
                      if (listsnap.connectionState == ConnectionState.none &&
                          listsnap.hasData == null) {
                        //print('project snapshot data is: ${projectSnap.data}');
                        return Container();
                      }
                      return akvt.akad_Adi == null
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                        // scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BouncingWidget(
                              child: GestureDetector(
                                  onLongPressUp: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AkademisyenGiris()));
                                  },
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 100,
                                      backgroundImage:
                                      NetworkImage(akvt.resim_url),
                                    ),
                                  )),
                            ),
                            Center(
                                child: Text(
                                  "Sayın " +
                                      akvt.akad_Adi +
                                      " " +
                                      akvt.akad_Soyadi +
                                      ", Hoş geldiniz!",
                                  style: GoogleFonts.notoSerif(),
                                )),
                            ExpansionTileCard(
                              title: Text("ÖĞRENİM BİLGİSİ"),
                              children: [
                                Container(
                                  height: 300,
                                  child: ListView.builder(
                                      itemCount: akvt.ogrenim_bilgileri.length,
                                      itemBuilder: (context,index){

                                        return ExpansionTileCard(
                                          title: Text(akvt.dizi.elementAt(index).toUpperCase()),
                                          trailing: Text(akvt.ogrenim_bilgileri.elementAt(index)["yil"]),
                                          subtitle: Text(akvt.ogrenim_bilgileri.elementAt(index)["universite"]),
                                          children: [
                                            Text(akvt.ogrenim_bilgileri.elementAt(index)["aciklama"])
                                          ],

                                        );}),
                                ),
                              ],
                            ),
                            ExpansionTileCard(
                              title: Text("AKAD. GÖREV LİSTESİ"),
                              children: [
                                Container(
                                  height: 300,
                                  child: ListView.builder(
                                      itemCount: akvt.akad_gorevListesi.length,
                                      itemBuilder: (context,index){

                                        return ExpansionTileCard(
                                          title: Text(akvt.akad_gorevListesi.elementAt(index)["unvan"]),
                                          trailing: Text(akvt.akad_gorevListesi.elementAt(index)["yil"]),
                                          subtitle: Text(akvt.akad_gorevListesi.elementAt(index)["universite"]),
                                          children: [
                                            Text(akvt.akad_gorevListesi.elementAt(index)["aciklama"])
                                          ],

                                        );}),
                                ),
                              ],
                            )

                          ],
                        ),
                      );
                    }
                ):Center(child: CircularProgressIndicator(),);
                
                
              }),
        ));
  }
}
