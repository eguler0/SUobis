import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Duyurular extends StatefulWidget {
  @override
  _DuyurularState createState() => _DuyurularState();
}

class _DuyurularState extends State<Duyurular> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 33, 61, 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight: Radius.circular(10))),
        title: Container(
            padding: EdgeInsets.only(right: 60),
            alignment: Alignment.center,
            child: Text(
              "DUYURULAR",
              textAlign: TextAlign.center,
            )),
      ),
      body: IntrinsicHeight(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  """Üniversitemiz ile Microsoft arasında yapılan kampüs anlaşması ile birlikte tüm öğrencilerimizin Microsoft office365 üyeliği aktif edilmiştir. Öğrencilerimiz https://www.office.com/ adresine bağlanarak oturum açın kısmından @ogr.selcuk.edu.tr uzantılı mail adresi ve aşağıda örnekte verilen geçici şifre ile sisteme bağlanıp yeni şifre oluşturarak bilgisayarlarına Office uygulamalarını ücretsiz olarak indirip kullanabileceklerdir.
Kullanıcı adı ve şifre örneği;
Örnek
Öğrenci Adı : Ahmet Büyük
Mail Adresi  123456789@ogr.selcuk.edu.tr
Şifre :  A12345b@
A     -     Adın İlk harfi (Büyük),
12345      -         Öğrenci numarasının ilk beş hanesi
b      -       Soyadın ilk harfi (küçük)
@     -       @ işareti

Bunlar birleştirilerek şifre olarak kullanılacaktır.Ayrıntılı bilgi için:
""",
                  style: GoogleFonts.robotoSlab(fontSize: 25),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
