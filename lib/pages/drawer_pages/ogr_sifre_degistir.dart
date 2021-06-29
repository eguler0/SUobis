import 'package:flutter/material.dart';
import 'package:okul_giris/myWidgets/label_textWidget.dart';
import 'package:okul_giris/pages/ogr_giris_ekrani.dart';
import 'package:okul_giris/service/service_ogrenci.dart';



class OgrenciSifreDegistir extends StatefulWidget {
  String kadi;
  String sifre;
   OgrenciSifreDegistir({this.kadi,this.sifre,Key key}) : super(key: key);

  @override
  _OgrenciSifreDegistirState createState() => _OgrenciSifreDegistirState();
}

class _OgrenciSifreDegistirState extends State<OgrenciSifreDegistir> {
  VeriTabani vt=new VeriTabani();
  TextEditingController tec1=new TextEditingController();
  TextEditingController tec2=new TextEditingController();
  TextEditingController tec3=new TextEditingController();
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
                  vt.sifreDegistirOgrenci(
                      widget.kadi, tec1.text, tec2.text, tec3.text);
                  Future.delayed(Duration(seconds: 3), () {
                    vt.degisiklik==true?Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage())):null;
                    return ScaffoldMessenger.of(context).showSnackBar(
                        vt.degisiklik == true ?
                        SnackBar(
                          content: Text('Şifreniz degistirildi!'),
                        ) : SnackBar(
                          content: Text(vt.mesaj),
                        )
                    );
                  });

                  if (vt.degisiklik == null) {

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
