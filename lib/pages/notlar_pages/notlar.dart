import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:okul_giris/service/service_ogrenci.dart';
import 'onayTakip.dart';

class Donem_Notlari extends StatefulWidget {
  String kadi;
  String sifre;
  Donem_Notlari({this.kadi, this.sifre});

  @override
  _Donem_NotlariState createState() => _Donem_NotlariState();
}

class _Donem_NotlariState extends State<Donem_Notlari> {

  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;
  VeriTabani vt=new VeriTabani();
  @override
  void initState() {
    debugPrint(widget.kadi+" "+widget.sifre);
    // user.initData(100);
    super.initState();
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
          "Genel Not Durumu",
          style: GoogleFonts.robotoSlab(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: vt.kullaniciya_ozel_veriler(widget.kadi,widget.sifre),

        builder: (context,snap){
          if (snap.connectionState == ConnectionState.none &&
              snap.hasData == null) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Container();
          }
          Future.delayed(Duration(seconds: 5),(){
          });
          return  FutureBuilder(
            future: vt.lesson_dataInf(),
            builder: (context,listsnap){
              if (listsnap.connectionState == ConnectionState.none &&
                  listsnap.hasData == null) {
                //print('project snapshot data is: ${projectSnap.data}');
                return Container();
              }
              return vt.adi!=null?ListView.builder(itemCount:1,itemBuilder: (context,index){
                return Container(
                  child: _getBodyWidget(index),
                );
              }):Center(child: CircularProgressIndicator(),);



            },
          );


        },
      ),
    );
  }
  Widget _getBodyWidget(int index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: HorizontalDataTable(
              leftHandSideColumnWidth: 100,
              rightHandSideColumnWidth: 600,
              isFixedHeader: true,
              headerWidgets: _getTitleWidget(),
              leftSideItemBuilder: _generateFirstColumnRow,
              rightSideItemBuilder: _generateRightHandSideColumnRow,
              itemCount: vt.g_DB_uzunluk,
              rowSeparatorWidget: const Divider(
                color: Colors.black54,
                height: 1.0,
                thickness: 0.0,
              ),
              leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
              rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
              verticalScrollbarStyle: const ScrollbarStyle(
                thumbColor: Colors.yellow,
                isAlwaysShown: true,
                thickness: 4.0,
                radius: Radius.circular(5.0),
              ),
              horizontalScrollbarStyle: const ScrollbarStyle(
                thumbColor: Colors.red,
                isAlwaysShown: true,
                thickness: 4.0,
                radius: Radius.circular(5.0),
              ),
              enablePullToRefresh: true,
              refreshIndicator: const WaterDropHeader(),
              refreshIndicatorHeight: 60,
              onRefresh: () async {
                //Do sth
                await Future.delayed(const Duration(milliseconds: 500));
                _hdtRefreshController.refreshCompleted();
              },
              htdRefreshController: _hdtRefreshController,
            ),
          ),
          Flexible(child: Container(
            color: Colors.limeAccent,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(),
            child: Text(vt.yil_sonu_akad_notlari.elementAt(index)["yil"]+" BAHAR YARI YILI:"+vt.yil_sonu_akad_notlari.elementAt(index)["akad_notu"]),
          ),
          ),

        ],
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget(
            'DERS KODU' ,
            100),
        onPressed: () {

          // setState(() {
          //   vt.g_DB_uzunluk=0;
          //   vt.g_DB_uzunluk=vt.g_DB_uzunluk;
          // });
        },
      ),
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget(
            'YARI YIL'
            ,
            120),
        onPressed: () {

          // setState(() {});
        },
      ),
      _getTitleItemWidget('DERS ADI', 100),
      _getTitleItemWidget('KREDİ', 100),
      _getTitleItemWidget('VİZE', 100),
      _getTitleItemWidget('FİNAL', 100),
      _getTitleItemWidget('BÜT', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(vt.g_DB.elementAt(index)["ders_id"]),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(vt.g_DB.elementAt(index)["yari_yil"]),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            alignment: Alignment.centerLeft,
          ),
        ),
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Text(vt.g_DB.elementAt(index)["ders_adi"]),
            ),
            width: 200,
            height: 52,
            alignment: Alignment.centerLeft,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:30.0),
            child: Container(
              child: Text(vt.g_DB.elementAt(index)["kredisi"]),
              width: 100,
              height: 52,

              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Container(
              child: Text(vt.vize_ders_notlari[vt.g_DB.elementAt(index)["ders_adi"]]),
              width: 100,
              height: 52,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ), Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Container(
              child: Text(vt.final_ders_notlari[vt.g_DB.elementAt(index)["ders_adi"]]),
              width: 100,
              height: 52,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ), Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Container(
              child: Text(vt.but_ders_notlari[vt.g_DB.elementAt(index)["ders_adi"]]),
              width: 100,
              height: 52,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }
}


