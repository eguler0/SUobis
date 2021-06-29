import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imagebutton/imagebutton.dart';
import 'package:okul_giris/pages/anaSayfa.dart';
import 'package:okul_giris/service/service_ogrenci.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double temp;
  String deskriksi;

  Future getData() async {
    try {
      http.Response res = await http.get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=Konya&APPID=b4877fd649c7ac8fbe8d9416da484a7b"));
      var data = jsonDecode(res.body);
      setState(() {
        temp = data["main"]["temp"];
        deskriksi = data["weather"][0]["description"];
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: this.getData(),
      builder: (context, listsnap) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/cloudy.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(50),
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/cloud_image.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text("KONYA",
                          style: TextStyle(color: Colors.white, fontSize: 30))
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 120),
                      child: Center(
                        child: Text(
                          temp != null
                              ? ((temp - 273.15).roundToDouble()).toString() +
                                  "\u00b0"
                              : "Loading",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 120),
                      child: Center(
                          child: Text(deskriksi.toString().toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30))),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(100,100,100,0),
                  child: ImageButton(
                    width: 200,
                    height: 100,
                    onTap: (){
                      Navigator.pop(context);
                    },
                    children: [Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios_outlined),
                        Text("ANASAYFA")
                      ],
                    )],
                    unpressedImage: Image.asset("assets/cloud_image.png"),
                    pressedImage: Image.asset("assets/cloud_image.png"),
                  ),
                )
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(200,200,50,0),
                //   child: GestureDetector(
                //     onTap: (){
                //       Navigator.push(context, MaterialPageRoute(builder:(context)=>newPage()));
                //     },
                //     child: Container(
                //       width: 120,
                //       height: 120,
                //       decoration: BoxDecoration(
                //         image: DecorationImage(
                //           image: AssetImage("assets/cloud_image.png"),
                //           fit: BoxFit.contain,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        );
      },
    ));
  }
}
