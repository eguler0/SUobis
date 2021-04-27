import 'package:flutter/material.dart';
import '../main.dart';

class HakkindaMetni extends StatefulWidget {
  @override
  _HakkindaMetniState createState() => _HakkindaMetniState();
}

class _HakkindaMetniState extends State<HakkindaMetni> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 10)),
            padding: EdgeInsets.all(20),
            child: Text(
                """Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193301061 numaralı Öğrenci ENES GÜLER tarafından 30 Nisan 2021 günü yapılmıştır.								
            """,style: TextStyle(fontSize: 20),),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Geri"),
        icon: Icon(Icons.arrow_back_ios,color: Colors.amber,),
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()) );
        },
      ),
    );
  }
}
