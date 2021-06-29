import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okul_giris/animation/FadeAnimation.dart';
import 'package:okul_giris/service/dosya_islemleri_service.dart';
import 'package:okul_giris/service/service_ogrenci.dart';
import 'package:okul_giris/pages/tum_girisler.dart';
import 'drawer_pages/giris_ekran.dart';
import 'drawer_pages/hakkinda.dart';
import 'drawer_pages/sifremi_unuttum.dart';
import 'anaSayfa.dart';
import 'drawer_pages/hakkinda.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  TextEditingController kadiCont = TextEditingController();
  TextEditingController sifreCont = TextEditingController();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String kadi = "";
  String sifre = "";
  bool durum = false;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  VeriTabani vt = new VeriTabani();
  bool beni_hatirla = false;
  List<String> _alan_doldur=new List<String>();
@override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(70, 156, 214, 1),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TumGirisler()));
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
          title: Center(
            child: Text("SELÇUK OBİS Comput.Eng"),
          ),
        ),
        body: FutureBuilder(
            future: fileUtils.readFromFile(),
            builder: (context, listsnap) {
              if (listsnap.connectionState == ConnectionState.none &&
                  listsnap.hasData == null) {
                //print('project snapshot data is: ${projectSnap.data}');
                return Container();
              }
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: IntrinsicHeight(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(2.0),
                            alignment: Alignment.topCenter,
                            child: FittedBox(
                                fit: BoxFit.fill,

                                //
                                child: FadeAnimation(1,CircleAvatar(
                                    minRadius: 100,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                    AssetImage("assets/e.png")))),
                          ),
                        ),
                        Container(
                          child: FadeAnimation(1.2,TextField(
                            controller: widget.kadiCont,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Ogrenci Numarası",
                            ),
                            cursorColor: Colors.red,
                            maxLength: 9,
                            maxLines: 1,
                          )),
                          margin: EdgeInsets.only(bottom: 20, top: 40),
                        ),
                        Container(
                          child: FadeAnimation(1.3,TextField(
                            controller: widget.sifreCont,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Sifre",
                            ),
                            //scrollPadding: EdgeInsets.only(bottom: 20),
                            cursorColor: Colors.red,
                            maxLength: 11,
                            maxLines: 1,
                          ),)
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: FadeAnimation(1.5,RaisedButton(
                            onPressed: () {
                              vt.kullaniciya_ozel_veriler(
                                  this.widget.kadiCont.text,
                                  this.widget.sifreCont.text);
                              Future.delayed(Duration(milliseconds: 4000), () {
                                if (vt.durum == true) {
                                  fileUtils.saveToFile(vt.adi +
                                      " " +
                                      vt.soyadi);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => newPage(
                                            kadi: this.widget.kadiCont.text,
                                            sifre:
                                            this.widget.sifreCont.text,
                                          )));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text('Yanlış Girdiniz!'),
                                    ),
                                  );
                                }
                                // (vt.durum == true
                                //     ?
                                //     : );
                              });
                            },
                            disabledColor: Colors.grey,
                            color:Color.fromRGBO(255, 202, 0, 1.0),
                            child: Text("Giriş Yap",style: TextStyle(color: Colors.white),),
                            elevation: 50,
                          ),)
                        ),
                        //_submitButton(),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(right: 20),
                                  alignment: Alignment.topLeft,
                                  //color: Colors.pink,
                                  child: Row(
                                    children: [
                                      // Checkbox(
                                      //   value: beni_hatirla,
                                      //   onChanged: (value) {
                                      //     setState(() {
                                      //       beni_hatirla = !beni_hatirla;
                                      //     });
                                      //   },
                                      // ),
                                      // Text("Beni Hatırla")
                                      // FlatButton(
                                      //     color: Color.fromRGBO(29, 53, 87, 1),
                                      //     textColor: Colors.orange,
                                      //     shape: RoundedRectangleBorder(
                                      //         borderRadius: BorderRadius.circular(70)),
                                      //     onPressed: () {
                                      //       null;
                                      //       // Navigator.push(
                                      //       //   context,
                                      //       //   MaterialPageRoute(
                                      //       //       builder: (context) => sifremiUnuttum()),
                                      //       // );
                                      //     },
                                      //     child: Text("Şifremi unuttum")),
                                    ],
                                  )),
                              FadeAnimation(1.5, FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HakkindaMetni()));
                                },
                                child: Row(
                                  children: [
                                    FadeAnimation(1.5, Text(
                                      "Hakkında",
                                      style: TextStyle(color: Colors.orange),
                                    ),),
                                    FadeAnimation(1.5, Icon(
                                      Icons.info_sharp,
                                      color: Colors.white,
                                    ))
                                  ],
                                ),
                                color: Color.fromRGBO(29, 53, 87, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(70)),
                              ),)
                            ],
                          ),
                        ),
                        FadeAnimation(1.5, Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            color: Color.fromRGBO(160, 193, 230, 1),
                            padding: EdgeInsets.all(8),
                            child: Text(fileUtils.fileContents == " "
                                ? "Hoşgeldiniz"
                                : "Hoşgeldiniz " + fileUtils.fileContents,),
                          ),
                        ),)
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  void giris() async {
    await vt
        .kullaniciya_ozel_veriler(widget.kadiCont.text, widget.sifreCont.text)
        .then((value) {
      debugPrint(vt.adi);
    });
    if (widget.kadiCont.text == vt.Numara &&
        widget.sifreCont.text == vt.Sifre) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => newPage(
                    kadi: this.widget.kadiCont.text,
                    sifre: this.widget.sifreCont.text,
                  )));

      durum = true;
    }
  }
}
