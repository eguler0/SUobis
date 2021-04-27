import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class SlaytGecisi extends StatefulWidget {
  @override
  _SlaytGecisiState createState() => _SlaytGecisiState();
}

class _SlaytGecisiState extends State<SlaytGecisi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 400,
          height: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Carousel(
            autoplay: true,
            boxFit: BoxFit.contain,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            dotSize: 8,
            dotIncreasedColor: Color(0xFFFF335C),
            dotBgColor: Colors.transparent,
            dotColor: Colors.black,
            dotPosition: DotPosition.bottomCenter,
            overlayShadow: false,
            dotVerticalPadding: -20.0,
            showIndicator: true,
            defaultImage: "assets/logo.png",

            //indicatorBgPadding: 10.0,
            images: [
              Image.asset("assets/1.jpg"),
              Image.asset("assets/2.jpg"),
              Image.asset("assets/3.jpg"),
              Image.asset("assets/4.jpg"),
            ],
          ),
        )
      ],
    );
  }
}
