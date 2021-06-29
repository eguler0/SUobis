import 'package:flutter/material.dart';
class GenelDuyuru_Icerik extends StatefulWidget {
  String icerik;
  String baslik;
   GenelDuyuru_Icerik(this.baslik,this.icerik, {Key key}) : super(key: key);

  @override
  _GenelDuyuru_IcerikState createState() => _GenelDuyuru_IcerikState();
}

class _GenelDuyuru_IcerikState extends State<GenelDuyuru_Icerik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("GENEL DUYURULAR"),
        backgroundColor: Color.fromRGBO(20, 33, 61,1),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10))),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.baslik,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
              ),
              Text(
                widget.icerik,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
