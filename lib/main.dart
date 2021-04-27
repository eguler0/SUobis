import 'package:flutter/material.dart';
import 'package:okul_giris/giris_ekran.dart';
import 'hakkinda.dart';
import 'sifremi_unuttum.dart';
import 'package:okul_giris/anaSayfa.dart';
import 'package:okul_giris/hakkinda.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => girisEkrani(),
        '/newpage': (context) => newPage(),
      },
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("SELÇUK OBİS Comput.Eng"),
        ),
      ),
      body: IntrinsicHeight(
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
                      child: CircleAvatar(
                        minRadius: 100,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/e.png")
                      )),
                ),
              ),
              Container(
                child: TextField(
                  controller: widget.kadiCont,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Ogrenci Numarası",
                  ),
                  cursorColor: Colors.red,
                  maxLength: 9,
                  maxLines: 1,
                ),
                margin: EdgeInsets.only(bottom: 20, top: 40),
              ),
              Container(
                child: TextField(
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
                ),
              ),
               SizedBox(
                 width: MediaQuery.of(context).size.width,
                 height: 40,

                 child: RaisedButton(

                   onPressed:giris,
                   disabledColor: Colors.grey,
                   color: Colors.orange,
                   child: Text("Giriş Yap"),
                   elevation: 50,
                 ),
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
                            FlatButton(

                                color: Color.fromRGBO(29, 53, 87, 1),
                                textColor: Colors.orange,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
                                onPressed: () {
                                  null;
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => sifremiUnuttum()),
                                  // );
                                },
                                child: Text("Şifremi unuttum")),
                          ],
                        )),

                    FlatButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>HakkindaMetni()));
                      },
                      child: Row(
                        children: [
                          Text("Hakkında",style: TextStyle(color: Colors.orange),),
                          Icon(Icons.info_sharp,color: Colors.white,)
                        ],
                      ),
                      color: Color.fromRGBO(29, 53, 87, 1),
                      shape:
                          RoundedRectangleBorder(borderRadius:BorderRadius.circular(70)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void giris() {
    if (widget.kadiCont.text == "193301061" &&
        widget.sifreCont.text == "1234") {
      Navigator.pushNamed(context, '/newpage');
      durum = true;
    }
  }
}
