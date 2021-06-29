import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:okul_giris/animation/FadeAnimation.dart';
import 'package:okul_giris/service/dosya_islemleri_service.dart';
import 'package:okul_giris/pages/akademisyen_pages/akademisyen_ana.dart';
import 'package:okul_giris/service/service_akademisyen.dart';
import 'package:okul_giris/service/service_ogrenci.dart';
import 'package:okul_giris/pages/tum_girisler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AkademisyenGiris());
}
class AkademisyenGiris extends StatefulWidget {
  TextEditingController kadiCont = TextEditingController();
  TextEditingController sifreCont = TextEditingController();

  @override
  _AkademisyenGirisState createState() => _AkademisyenGirisState();
}

class _AkademisyenGirisState extends State<AkademisyenGiris> {
  String kadi = "";
  String sifre = "";
  bool durum = false;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  VeriTabani vt = new VeriTabani();
  Akademisyen_VeriTabani akvt=new Akademisyen_VeriTabani();
@override
  void initState() {
    // TODO: implement initState
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
      body:FutureBuilder(
      future: fileUtils.readFromFile(),
    builder: (context,listsnap){
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
                            backgroundImage: AssetImage("assets/e.png")))),
                  ),
                ),
                Container(
                  child: FadeAnimation(1.2,TextField(
                    controller: widget.kadiCont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Akademisyen Kullanıcı Adı",
                    ),
                    cursorColor: Colors.red,
                    maxLength: 9,
                    maxLines: 1,
                  ),),
                  margin: EdgeInsets.only(bottom: 20, top: 40),
                ),
                Container(
                  child: FadeAnimation(1.5,TextField(
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
                    onPressed:(){akvt.veriCek_Akademisyen(this.widget.kadiCont.text, this.widget.sifreCont.text);
                    Future.delayed(Duration(milliseconds: 3500), () {
                      (akvt.durum == true
                          ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AkademisyenAnaSayfasi(
                                    kadi: this.widget.kadiCont.text,
                                    sifre: this.widget.sifreCont.text,
                                  )))
                          : ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Bilgileri Yanlış Girdiniz!'),
                        ),
                      ));
                    });},
                    disabledColor: Colors.grey,
                    color:Color.fromRGBO(255, 202, 0, 1.0),
                    child: Text("Giriş Yap"),
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
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    color: Color.fromRGBO(160, 193, 230, 1),
                    padding: EdgeInsets.all(8),
                    child: Text(
                        "Akademisyen:ACC  Şifre:1234 olarak giriniz."),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
      })


    );
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
              builder: (context) => AkademisyenAnaSayfasi(
                kadi: this.widget.kadiCont.text,
                sifre: this.widget.sifreCont.text,
              )));

      durum = true;
    }
  }
}
