import 'dart:async';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okul_giris/myWidgets/elevatedButton.dart';
import 'package:okul_giris/pages/akademisyen_pages/akademisyen_giris.dart';
import 'package:okul_giris/service/service_ogrenci.dart';
import 'package:okul_giris/service/service_akademisyen.dart';

class NotEkle extends StatefulWidget {
  String kadi;
  String sifre;
  String value = "";
  String value2 = "";

  NotEkle({Key key, this.kadi, this.sifre}) : super(key: key);

  @override
  _NotEkleState createState() => _NotEkleState();
}

Akademisyen_VeriTabani akvt = new Akademisyen_VeriTabani();
List<String> sinav_turleri = ["vize", "final", "but"];
var accountname;
int sayac = 0;
TextEditingController tec1 = new TextEditingController();
TextEditingController tec2 = new TextEditingController();

class _NotEkleState extends State<NotEkle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(0, 29, 61, 1),
            title: Container(
              padding: EdgeInsets.only(right: 50),
              alignment: Alignment.center,
              child: Text(
                "NOT EKLE",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )),
        body: FutureBuilder(
            future: akvt.veriCek_Akademisyen(widget.kadi, widget.sifre),
            builder: (context, listsnap) {
              if (listsnap.connectionState == ConnectionState.none &&
                  listsnap.hasData == null) {
                //print('project snapshot data is: ${projectSnap.data}');
                return Container();
              }
              return akvt.akad_Adi == null
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: DropdownButton(
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return akvt.ders_adlari
                                          .toList()
                                          .map<Widget>((String item) {
                                        return Padding(
                                            padding: EdgeInsets.only(right: 80),
                                            child: Text(item));
                                      }).toList();
                                    },
                                    isDense: true,
                                    iconSize: 20,
                                    //isExpanded: true,
                                    icon: Icon(
                                      Icons.unfold_more,
                                      color: Colors.black,
                                    ),
                                    // style: TextStyle(),

                                    items: akvt.ders_adlari
                                        .toList()
                                        .map(
                                          (String item) => DropdownMenuItem(
                                            child: Text(item),
                                            value: item,
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        this.widget.value = value;
                                      });
                                    },
                                    hint: Text(
                                      widget.value==""?"Ders seçiniz":widget.value,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: DropdownButton(
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return sinav_turleri
                                          .map<Widget>((String item) {
                                        return Padding(
                                            padding:
                                                EdgeInsets.only(right: 120),
                                            child: Text(item));
                                      }).toList();
                                    },
                                    isDense: true,
                                    iconSize: 20,
                                    //isExpanded: true,
                                    icon: Icon(
                                      Icons.unfold_more,
                                      color: Colors.black,
                                    ),
                                    // style: TextStyle(),

                                    items: sinav_turleri
                                        .map(
                                          (String item) => DropdownMenuItem(
                                            child: Text(item),
                                            value: item,
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        this.widget.value2 = value;
                                      });
                                    },
                                    hint: Text(
                                      this.widget.value2==""?"Sınav seçiniz":this.widget.value2,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: TextFormField(
                                    controller: tec1,
                                    decoration: InputDecoration(
                                        labelText: "Numara:",
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: TextFormField(
                                    controller: tec2,
                                    decoration: InputDecoration(
                                        labelText: "Not:",
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: RaisedButton(
                              child: Text("NOT EKLE"),
                              onPressed: () {
                                akvt.veriEkle(widget.value, widget.value2,
                                    tec1.text, tec2.text);
                              }),
                        )
                      ],
                    );
            }));
  }
}
