import 'package:flutter/material.dart';
import 'package:okul_giris/myWidgets/grafik_widget/pie_chart_dart.dart';
import 'package:okul_giris/service/service_ogrenci.dart';

class NotDurumuGrafik extends StatefulWidget {
  String kadi;
  String sifre;

  NotDurumuGrafik(this.kadi, this.sifre, {Key key}) : super(key: key);

  @override
  _NotDurumuGrafikState createState() => _NotDurumuGrafikState();
}

class _NotDurumuGrafikState extends State<NotDurumuGrafik> {
  GrafikVeriTabani _grafikVeriTabani = new GrafikVeriTabani();

  @override
  void initState() {
    _grafikVeriTabani.sinavlarGet(widget.kadi, widget.sifre);
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 33, 61, 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        title: Container(
            padding: EdgeInsets.only(right: 60),
            alignment: Alignment.center,
            child: Text(
              "SINAV ORTALAMA GRAFİĞİ",
              textAlign: TextAlign.center,
            )),
      ),
      body: FutureBuilder(
        future: _grafikVeriTabani.sinavlarGet(widget.kadi, widget.sifre),
        builder: (context, listsnap) {
          if (listsnap.connectionState == ConnectionState.none &&
              listsnap.hasData == null) {
            return Container();
          }
          return _grafikVeriTabani.sinavlarGet(widget.kadi, widget.sifre) !=
                  null
              ? Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("TÜM NOTLARIN ORTALAMA YÜZDESİ"),
                      ),
                      PieChartExample(3, _grafikVeriTabani.vizeOrt,
                          _grafikVeriTabani.finalOrt, _grafikVeriTabani.butOrt),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton:
          FloatingActionButton.extended(onPressed: (){
            Navigator.pop(context);
          }, label: Icon(Icons.arrow_back_ios_sharp)),
      //
    );
  }
}
