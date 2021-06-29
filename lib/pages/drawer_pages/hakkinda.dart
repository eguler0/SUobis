import 'package:flutter/material.dart';
import 'package:okul_giris/model/sql_model.dart';
import 'package:okul_giris/service/sql_service.dart';
import '../../main.dart';
import 'package:flutter/widgets.dart';
import '../ogr_giris_ekrani.dart';

class HakkindaMetni extends StatefulWidget {
  @override
  _HakkindaMetniState createState() => _HakkindaMetniState();
}


class _HakkindaMetniState extends State<HakkindaMetni> {

  DbHelper _dbHelper=new DbHelper();
   Hakkinda_Metni hkm=new Hakkinda_Metni(id: 1,metin: """Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193301061 numaralı Öğrenci ENES GÜLER tarafından 25 Haziran 2021 günü yapılmıştır.
""" );
  @override


  void initState(){
   _dbHelper.insertMetin(hkm);
_dbHelper.getMetin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder(
        future: _dbHelper.getMetin(),
    builder: (context,listsnap){
    if (listsnap.connectionState == ConnectionState.none &&
    listsnap.hasData == null) {
    //print('project snapshot data is: ${projectSnap.data}');
    return Container();
    }
    return  _dbHelper.gelen_metin!=null?Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 10)),
          padding: EdgeInsets.all(20),
          child: Text(
            _dbHelper.gelen_metin.toString()!=null?_dbHelper.gelen_metin.toString():"Loading",style: TextStyle(fontSize: 20),),
        ),
      ),
    ):CircularProgressIndicator();
        }),



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
