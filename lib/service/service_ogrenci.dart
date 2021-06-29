import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:okul_giris/pages/akademisyen_pages/akad_sifre_degistir.dart';
import 'package:okul_giris/service/dosya_islemleri_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'service_akademisyen.dart';

class VeriTabani {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool durum;
  String Sifre = "";
  String Numara = "";
  String adi;
  String soyadi;
  String fakulte;
  String danisman;
  bool degisiklik;
  String eposta;
  String bolum;
  int g_DB_uzunluk;
  var dokuman_id;
  Set<String> genel_ders_adlari;
  Map<String, dynamic> vize_ders_notlari;
  Map<String, dynamic> final_ders_notlari;
  Map<String, dynamic> but_ders_notlari;
  String resim_url;
  Set<Map<String, dynamic>> g_DB = new Set<Map<String, dynamic>>();
  Map<String, dynamic> duyuru_basliklari;
  Set<String> ders_numaralari=new Set<String>();
  Map<String, dynamic> duyuru_icerikleri;
  Set<Map<String,dynamic>> yil_sonu_akad_notlari;
  Map<String, dynamic> duyuru_tarihleri;
  Map<String, dynamic> duyuru_saatleri;
  Set<Map<String,dynamic>> onay_TakipListesi = new  Set<Map<String,dynamic>>();
  Set<Map<String,dynamic>> ders_Gorevli_Mapi = new  Set<Map<String,dynamic>>();
  DocumentSnapshot gelen;
  String mesaj="";
  Set<String> ders_kodlari;
  Future kullaniciya_ozel_veriler(String tec1, String tec2) async {
    gelen = await _firestore.collection("students").get().then((value) {
      ;
    });

    var numara = await _firestore
        .collection("students")
        .where("numara", isEqualTo: tec1)
        .get();
    numara.docs.forEach((element) {
      Sifre = element.data()["sifre"];
    });

    var sifre = await _firestore
        .collection("students")
        .where("sifre", isEqualTo: tec2)
        .get();
    sifre.docs.forEach((eleman) {
      // debugPrint(eleman.data().toString());
      Numara = eleman.data()["numara"];
      adi = eleman.data()["adi"];
      soyadi = eleman.data()["soyadi"];

      fakulte = eleman.data()["fakulte"];
      danisman = eleman.data()["danisman"];
      eposta = eleman.data()["eposta"];
      bolum = eleman.data()["bolum"];
    });
    // StorageReference ref =
    // FirebaseStorage.instance.ref().child("images/sky.jpg");
    // String url = (await ref.getDownloadURL()).toString();
    try {
      Reference ref =
      FirebaseStorage.instance.ref().child("ogr_foto/" + Numara + ".jpg");

      resim_url = await ref.getDownloadURL().then((value) => value);

    } catch (e) {
      debugPrint("HATA ALDK k_özel_veriler");
    }
    if ((sifre.docs.isNotEmpty && Sifre == tec2) ||
        (numara.docs.isNotEmpty && Numara == tec1)) {
      durum = true;
      sifre.docs.forEach((element) {
        dokuman_id = element.id.toString();
      });
    } else {
      durum = false;
    }
    var ders_adlari_ref = await _firestore
        .collection("students")
        .doc(dokuman_id)
        .collection("dersler")
        .get();
    var liste = ders_adlari_ref.docs.toList();
  yil_sonu_akad_notlari=new Set<Map<String,dynamic>>();
    genel_ders_adlari = new Set<String>();
    vize_ders_notlari = new Map<String, dynamic>();
    final_ders_notlari = new Map<String, dynamic>();
    but_ders_notlari = new Map<String, dynamic>();
    var akad_not_ort = await _firestore.collection("students")
        .doc(dokuman_id)
        .collection("dersler")
        .doc("notlar").collection("yil_sonu_akad_notu").get();
    akad_not_ort.docs.forEach((element) {
      yil_sonu_akad_notlari.add(element.data());
    });
    try {
      var vize_cek = await _firestore
          .collection("students")
          .doc(dokuman_id.toString())
          .collection("dersler")
          .doc("notlar")
          .collection("vizeler")
          .get();
      vize_cek.docs.forEach((element) {
        element.data().forEach((key, value) {
          vize_ders_notlari[key] = value;
        });
      });
      //return map;
    } catch (e) {
      debugPrint("HATA ALDIK vize_cek: " + e.toString());
    }
    try {
      var final_cek = await _firestore
          .collection("students")
          .doc(dokuman_id.toString())
          .collection("dersler")
          .doc("notlar")
          .collection("finaller")
          .get();
      final_cek.docs.forEach((element) {
        element.data().forEach((key, value) {
          final_ders_notlari[key] = value;
        });
      });
    } catch (e) {
      debugPrint("HATA ALDIK final_cek: " + e.toString());
    }
    try {
      var but_cek = await _firestore
          .collection("students")
          .doc(dokuman_id.toString())
          .collection("dersler")
          .doc("notlar")
          .collection("butler")
          .get();
      but_cek.docs.forEach((element) {
        element.data().forEach((key, value) {
          but_ders_notlari[key] = value;
        });
      });
    } catch (e) {
      debugPrint("HATA ALDIK but_cek: " + e.toString());
    }


    liste.forEach(
          (element) =>
          element
              .data()
              .values
              .forEach(
                (value) => genel_ders_adlari.add(value),
          ),
    );
    try {
      for (int i = 0; i < genel_ders_adlari.length; i++) {
        var ders_bilgileri = await _firestore
            .collection("code_lesson_teacher")
            .where("ders_adi", isEqualTo: genel_ders_adlari.elementAt(i))
            .get();
        ders_bilgileri.docs.forEach(
                (element) {
              g_DB.add(element.data());
            }
        );
      }

      // g_DB.firstWhere((a) => a == a, orElse: () => null);

    } catch (e) {
      debugPrint("Hata Aldık DERS_Bılgisi: " + e.toString());
    }
    g_DB_uzunluk = g_DB.length;
    debugPrint(g_DB_uzunluk.toString());
    return g_DB;
  }

  Future lesson_dataInf() async {

  }
  Future DuyuruGetir() async {
    duyuru_basliklari = new Map<String, dynamic>();
    duyuru_icerikleri = new Map<String, dynamic>();
    duyuru_tarihleri = new Map<String, dynamic>();
    duyuru_saatleri = new Map<String, dynamic>();
    try {
      var basliklar = await _firestore.collection("general_announcements").doc(
          "basliklar").get();
      basliklar.data().forEach((key, value) {
        duyuru_basliklari[key] = value;
      });
      var icerikler = await _firestore.collection("general_announcements").doc(
          "icerikler").get();
      icerikler.data().forEach((key, value) {
        duyuru_icerikleri[key] = value;
      });
      var tarihler = await _firestore.collection("general_announcements").doc(
          "tarihler").get();
      tarihler.data().forEach((key, value) {
        duyuru_tarihleri[key] = value;
      });
      var saatler = await _firestore.collection("general_announcements").doc(
          "saatler").get();
      saatler.data().forEach((key, value) {
        duyuru_saatleri[key] = value;
      });


      debugPrint("element sayisi " + duyuru_basliklari.length.toString());
    } catch (e) {
      debugPrint("HATA ALDIK: Duyuru getirirken");
    }
    // duyuru_Mapleri.forEach((element) { element.forEach((key, value) {
    //   debugPrint("KEY : "+key+ " "+ "VALUE : "+value);
    // });});
    return duyuru_basliklari;
  }

  Future sifreDegistirOgrenci(String kadi,String eski_sifre,String yeni_sifre,String yeni_sifre_tekrari) async{
    var ogr_id=await _firestore.collection("students").where("numara",isEqualTo: kadi).get();
    dokuman_id=ogr_id.docs.first.id;
    var sifre=ogr_id.docs.elementAt(0)["sifre"];
    debugPrint(sifre);
    if (eski_sifre == sifre && (yeni_sifre == yeni_sifre_tekrari)) {
      await _firestore.collection("students").doc(dokuman_id).set(
          {"sifre": yeni_sifre}, SetOptions(merge: true)).then((value) =>
      degisiklik = true);

      debugPrint("degisiklik: " + degisiklik.toString());
    } else if (eski_sifre != sifre) {
      mesaj = "Eski şifreniz doğru girilmedi";
      degisiklik = false;
    } else if (yeni_sifre_tekrari != yeni_sifre) {
      mesaj = "yeni şifren biribiriyle uyuşmuyor.";
      degisiklik = false;
    } else {
      mesaj = "Girdiğiniz bütün değerler yanlış";
      degisiklik = false;
    }

  }

  Akademisyen_VeriTabani akvt = new Akademisyen_VeriTabani();

  Future Ders_Onay_Tablosu(String numara) async{
    ders_kodlari={"3301452","3301453","3301454","3301456"};
    try{
      var ogrenci=await _firestore.collection("students").where("numara",isEqualTo: numara).get();
      ogrenci.docs.forEach((element) {
        dokuman_id=element.id;
      });
      for(int i=0;i<ders_kodlari.length;i++){
        var onay_takip= await _firestore.collection("students").doc(dokuman_id).collection(
            "dersler").doc("onay_takip").collection(ders_kodlari.elementAt(i)).where("yil",isEqualTo: "2021").get();
        // debugPrint(onay_takip.data().toString());
        onay_takip.docs.forEach((element) {
          debugPrint(element.data().toString());
          onay_TakipListesi.add(element.data());
        });
        // debugPrint(onay_takip.data().toString());
        // onay_takip.data().forEach((key, value) {
        //   onay_takip[ders_kodlari.elementAt(i)][key]=value;
        //   debugPrint(onay_takip[ders_kodlari.elementAt(i)][key]);
        // });
      }
    }catch(e){

    }




    // onay_takip.then((value) => value.data().toString() {
    //
    // }));
  }
  Future Ders_Gorevli_Tablosu()async{
    try{
      ders_kodlari={"3301452","3301453","3301454","3301456"};
      for(int i=0;i<ders_kodlari.length;i++) {
        var ogrenci=await _firestore.collection("code_lesson_teacher").doc(ders_kodlari.elementAt(i)).get();
        ders_Gorevli_Mapi.add(ogrenci.data());
      }
    }catch(e){
      debugPrint("HATA ŞUDUR: "+e.toString());

    }




  }
  Future dersNotuCek() async {
    //await ders_notlari.toString();
  }
}

class GrafikVeriTabani {
  double vizeOrt = 0;
  double finalOrt = 0;
  double butOrt = 0;

  Map<String, dynamic> vizeler = new Map<String, dynamic>();
  Map<String, dynamic> finaller = new Map<String, dynamic>();
  Map<String, dynamic> butler = new Map<String, dynamic>();
  String ogr_id;
  VeriTabani vt = new VeriTabani();
  FirebaseFirestore _firestore_grafik = FirebaseFirestore.instance;

  Future sinavlarGet(String kadi, String sifre) async {
    var data = await _firestore_grafik.collection("students").where(
        "numara", isEqualTo: kadi).get();
    data.docs.forEach((element) {
      ogr_id = element.id;
    });
    double top = 0;


    debugPrint(vt.dokuman_id);
    var vize = await _firestore_grafik.collection("students").doc(ogr_id)
        .collection("dersler").doc("notlar").collection("vizeler").doc(
        "vize_notlari")
        .get();
    vize.data().forEach((key, value) {
      vizeler[key] = value;
      // top+=double.parse(value);
      // debugPrint(vizeler.toString());
      // debugPrint(top.toString());
    });
    var final_cek = await _firestore_grafik.collection("students").doc(ogr_id)
        .collection("dersler").doc("notlar").collection("finaller").doc(
        "final_notlari")
        .get();
    final_cek.data().forEach((key, value) {
      finaller[key] = value;
      // top+=double.parse(value);
      // debugPrint(finaller.toString());
      // debugPrint(top.toString());
    });
    var but = await _firestore_grafik.collection("students").doc(ogr_id)
        .collection("dersler").doc("notlar").collection("butler").doc(
        "but_notlari")
        .get();
    but.data().forEach((key, value) {
      butler[key] = value;
      // top+=double.parse(value);
      // debugPrint(butler.toString());
      // debugPrint(top.toString());
    });
    try {
      vizeOrt = 0;
      finalOrt = 0;
      butOrt = 0;
      vizeler.values.forEach((element) {
        vizeOrt += double.tryParse(element);
      });
      vizeOrt /= vizeler.length;
      finaller.values.forEach((element) {
        finalOrt += double.tryParse(element);
      });
      finalOrt /= finaller.length;
      butler.values.forEach((element) {
        butOrt += double.tryParse(element);
      });
      butOrt /= butler.length;
    } catch (e) {}
  }


// debugPrint(data.toString());
}


// class Akademisyen_VeriTabani {
//   bool durum;
//   String akad_Soyadi;
//   String resim_url;
//   String akad_Adi;
//   String Sifre;
//   String K_adi;
//   var kadi_Akad;
//   var sifre_Akad;
//   String mail_Akad;
//   var dokuman_id;
//   var ogrenci_id;
//   Set<String> ders_no = new Set<String>();
//   Set<String> ders_adlari = new Set<String>();
//   final FirebaseFirestore firestore_akademisyen = FirebaseFirestore.instance;
//   String ogr_no;
//
//   void veriEkle(
//       String ders_Adi, String sinav_turu, String numara, String ogr_Not) async {
//     Map<String, dynamic> sinav_Ekle = Map();
//     sinav_Ekle[ders_Adi] = ogr_Not;
//
//     var ogrenci = await firestore_akademisyen
//         .collection("students")
//         .where("numara", isEqualTo: numara)
//         .get();
//     ogrenci.docs.forEach((element) {
//       ogrenci_id = element.id;
//     });
//
//     firestore_akademisyen
//         .collection("students")
//         .doc(ogrenci_id)
//         .collection("dersler")
//         .doc("notlar")
//         .collection(sinav_turu + "ler")
//         .doc(sinav_turu + "_notlari")
//         .set(sinav_Ekle, SetOptions(merge: true));
//     debugPrint(sinav_turu);
//     debugPrint(ders_Adi);
//     debugPrint(numara);
//     debugPrint(ogr_Not);
//   }
//
//   Future veriCek_Akademisyen(String tec1, String tec2) async {
//     var all_data = await firestore_akademisyen
//         .collection("teachers")
//         .where("k_adi", isEqualTo: tec1)
//         .get();
//     all_data.docs.forEach((element) {
//       sifre_Akad = element.data()["sifre"];
//       kadi_Akad = element.data()["k_adi"];
//       mail_Akad=element.data()["email"];
//     });
//     var sifre = await firestore_akademisyen
//         .collection("teachers")
//         .where("sifre", isEqualTo: tec2)
//         .get();
//     sifre.docs.forEach((element) {
//       K_adi = element.data()["k_adi"];
//       debugPrint(K_adi);
//     });
//     var k_adi = await firestore_akademisyen
//         .collection("teachers")
//         .where("k_adi", isEqualTo: tec1)
//         .get();
//     k_adi.docs.forEach((element) {
//       Sifre = element.data()["sifre"];
//       debugPrint(Sifre);
//     });
//
//     if ((sifre.docs.isNotEmpty && Sifre == tec2) ||
//         (k_adi.docs.isNotEmpty && K_adi == tec1)) {
//       durum = true;
//       sifre.docs.forEach((element) {
//         dokuman_id = element.id.toString();
//
//         debugPrint(dokuman_id);
//         akad_Adi = element.data()["adi"];
//         akad_Soyadi = element.data()["soyadi"];
//       });
//     } else {
//       durum = false;
//     }
//
//     try{
//       Reference ref=FirebaseStorage.instance.ref().child("ogrt_foto/"+this.kadi_Akad+".png");
//       resim_url= await ref.getDownloadURL().then((value) => value);
//     }catch(e){
//       debugPrint("Akademisyen resmi geitirlimedi");
//     }
//
//     var dersler = await firestore_akademisyen
//         .doc("teachers/" + dokuman_id + "/dersler/girilen_dersler")
//         .get();
//     dersler.data().forEach((key, value) {
//       ders_no.add(key);
//       ders_adlari.add(value);
//     });
//     return ders_adlari;
//   }
// }

class Weather {
  var data;
  double sicaklik;

  Future weather_Status() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=Konya&APPID=b4877fd649c7ac8fbe8d9416da484a7b"));
      data = jsonDecode(response.body);
      sicaklik = data["main"][0]["temp"];
    } catch (e) {}

    debugPrint(sicaklik.toString());
  }
}


// GetOrt(){
//
// double Ort=0;
//
//
//   try{
//     sinavlarGet().whenComplete(() {
//         vizeler.values.forEach((element) {
//           Ort+=double.tryParse(element);
//         });
//         Ort/=vizeler.length;
//         debugPrint("ORT "+Ort.toString());
//
//       });
//     debugPrint("ORT "+Ort.toString());
//       return Ort;
//
//
//   }catch(e){}
//     }