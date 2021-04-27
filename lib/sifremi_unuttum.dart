import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sifremiUnuttum extends StatefulWidget {
  @override
  _sifremiUnuttumState createState() => _sifremiUnuttumState();
}

class _sifremiUnuttumState extends State<sifremiUnuttum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicHeight(
          //child: Center(
          child: Container(
            color: Colors.amber,
            width: 350,
            height: 350,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text(
                    "ÖĞRENCİ ŞİFRE HATIRLAMA",
                    style: GoogleFonts.josefinSans(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    endIndent: 10,
                    height: 10,
                    color: Colors.blueGrey,

                  ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder(),
                              labelText: "Öğrenci Numaranız",
                                icon: Icon(Icons.person)
                              ),
                        ),
                      ),

                  TextField(
                    decoration: InputDecoration(border: OutlineInputBorder(),
                    labelText: "mail"),
                  )


                ],
              ),
            ),
          ),

          //),
        ),
      ),
    );
  }
}
