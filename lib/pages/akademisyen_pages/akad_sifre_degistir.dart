import 'package:flutter/material.dart';
import 'package:okul_giris/myWidgets/label_textWidget.dart';
import 'package:okul_giris/pages/ogr_giris_ekrani.dart';
import 'package:okul_giris/pages/akademisyen_pages/akademisyen_giris.dart';
import 'package:okul_giris/service/service_akademisyen.dart';

class SifreDegistir extends StatefulWidget {
  String kadi;
  String sifre;
  SifreDegistir({this.kadi,this.sifre,Key key}) : super(key: key);

  @override
  _SifreDegistirState createState() => _SifreDegistirState();
}

class _SifreDegistirState extends State<SifreDegistir> {
  Akademisyen_VeriTabani akvt=new Akademisyen_VeriTabani();
  TextEditingController tec1=new TextEditingController();
  TextEditingController tec2=new TextEditingController();
  TextEditingController tec3=new TextEditingController();
  @override
  void initState() {
    akvt.durum==true?Navigator.push(context, MaterialPageRoute(builder: (contex)=>MyHomePage())):null;
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
              "Şifre Değiştir",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )),
      body: Scaffold(
        body:
        Column(
          children: [
            Label_TextWidget(tec1,"Eski Şifre:","Eski Şifre",true),
            Label_TextWidget(tec2,"Yeni Şifre:","Yeni Şifre",true),
            Label_TextWidget(tec3,"Yeni Şifre Tekrar:","Yeni Şifre Tekrar",true),
            RaisedButton(onPressed: (){
              try{
                setState(() {
                  akvt.sifreDegisitir(
                      widget.kadi, tec1.text, tec2.text, tec3.text);
                  Future.delayed(Duration(seconds: 3), () {
                    akvt.degisiklik==true?Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AkademisyenGiris())):null;
                    return ScaffoldMessenger.of(context).showSnackBar(
                        akvt.degisiklik == true ?
                        SnackBar(
                          content: Text('Şifreniz degistirildi!'),
                        ) : SnackBar(
                          content: Text(akvt.mesaj),
                        )
                    );
                  });

                  if (akvt.degisiklik == null) {

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => AkademisyenGiris()));
                      return Center(
                        child: CircularProgressIndicator(),
                      );

                  }
                });
              }catch(e){

              }


            },child: Text("GÜNCELLE"),)
          ],
        ),
      ),
    );
  }
}
