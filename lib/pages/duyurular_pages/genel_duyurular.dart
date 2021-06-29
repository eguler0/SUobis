import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:okul_giris/pages/duyurular_pages/genel_duyurular_icerik.dart';
import 'package:okul_giris/service/service_ogrenci.dart';

class Uzem_Duyurular extends StatefulWidget {
  const Uzem_Duyurular({Key key}) : super(key: key);

  @override
  _Uzem_DuyurularState createState() => _Uzem_DuyurularState();
}

class _Uzem_DuyurularState extends State<Uzem_Duyurular> {
  bool durum = false;
  double deger = 10;

  @override
  void setState(fn) {
    vt.DuyuruGetir();
    super.setState(fn);
  }

  void initState() {
    deger = 10;
    super.initState();
  }

  VeriTabani vt = new VeriTabani();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("GENEL DUYURULAR"),
          backgroundColor: Colors.lime,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
        body: FutureBuilder(
            future: vt.DuyuruGetir(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none &&
                  snapshot.hasData == false) {
                return Container();
              }
              return FutureBuilder(
                  future: vt.DuyuruGetir(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none &&
                        snapshot.hasData == false) {
                      return Container();
                    }
                    return vt.duyuru_basliklari.isEmpty != true
                        ? GridView.builder(
                            itemCount: vt.duyuru_basliklari.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   durum==true?deger=10:deger=0;
                                  //   durum=!durum;
                                  // });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GenelDuyuru_Icerik(vt.duyuru_basliklari.values.elementAt(index),vt.duyuru_icerikleri.values.elementAt(index))));
                                },
                                child: AnimatedPadding(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.elasticInOut,
                                  padding: EdgeInsets.all(0),
                                  child: Card(
                                    child: ListTile(
                                      title: Container(
                                        width: 100,
                                          height: 100,
                                          child: Text(vt
                                              .duyuru_basliklari.values
                                              .elementAt(index))),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 30, 10, 0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.calendar_today),
                                                Text(vt
                                                    .duyuru_tarihleri.values
                                                    .elementAt(index)),
                                              ],
                                            ),
                                            Row(
                                                children: [
                                                  Icon(Icons.access_time_rounded),
                                                  Text(vt
                                                      .duyuru_saatleri.values
                                                      .elementAt(index))
                                                ],
                                            )


                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })
                        : Center(child: CircularProgressIndicator());
                  });
            }));
  }
}
