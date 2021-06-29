import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Akademisyen_VeriTabani {
  bool durum;
  bool degisiklik;
  String mesaj;
  String akad_Soyadi;
  String resim_url;
  String akad_Adi;
  String akad_id;
  String Sifre;
  String K_adi;
  var kadi_Akad;
  var sifre_Akad;
  String mail_Akad;
  var dokuman_id;
  var ogrenci_id;
  Set<String> dizi={"lisans","yuksek_lisans","doktora"};
  Set<Map<String,dynamic>> ogrenim_bilgileri=new Set<Map<String,dynamic>>();
  Set<Map<String,dynamic>> akad_gorevListesi=new Set<Map<String,dynamic>>();

  Set<String> ders_no = new Set<String>();
  Set<String> ders_adlari = new Set<String>();
  final FirebaseFirestore firestore_akademisyen = FirebaseFirestore.instance;
  String ogr_no;

  void veriEkle(String ders_Adi, String sinav_turu, String numara,
      String ogr_Not) async {
    Map<String, dynamic> sinav_Ekle = Map();
    sinav_Ekle[ders_Adi] = ogr_Not;

    var ogrenci = await firestore_akademisyen
        .collection("students")
        .where("numara", isEqualTo: numara)
        .get();
    ogrenci.docs.forEach((element) {
      ogrenci_id = element.id;
    });

    firestore_akademisyen
        .collection("students")
        .doc(ogrenci_id)
        .collection("dersler")
        .doc("notlar")
        .collection(sinav_turu + "ler")
        .doc(sinav_turu + "_notlari")
        .set(sinav_Ekle, SetOptions(merge: true));
    debugPrint(sinav_turu);
    debugPrint(ders_Adi);
    debugPrint(numara);
    debugPrint(ogr_Not);
  }

  Future veriCek_Akademisyen(String tec1, String tec2) async {
    var all_data = await firestore_akademisyen
        .collection("teachers")
        .where("k_adi", isEqualTo: tec1)
        .get();
    all_data.docs.forEach((element) {
      sifre_Akad = element.data()["sifre"];
      kadi_Akad = element.data()["k_adi"];
      mail_Akad = element.data()["email"];
      akad_id = element.id;
    });
    var sifre = await firestore_akademisyen
        .collection("teachers")
        .where("sifre", isEqualTo: tec2)
        .get();
    sifre.docs.forEach((element) {
      K_adi = element.data()["k_adi"];
      debugPrint(K_adi);
    });
    var k_adi = await firestore_akademisyen
        .collection("teachers")
        .where("k_adi", isEqualTo: tec1)
        .get();
    k_adi.docs.forEach((element) {
      Sifre = element.data()["sifre"];
      debugPrint(Sifre);
    });

    if ((sifre.docs.isNotEmpty && Sifre == tec2) ||
        (k_adi.docs.isNotEmpty && K_adi == tec1)) {
      durum = true;
      sifre.docs.forEach((element) {
        dokuman_id = element.id.toString();

        debugPrint(dokuman_id);
        akad_Adi = element.data()["adi"];
        akad_Soyadi = element.data()["soyadi"];

      });
    } else {
      durum = false;
    }


    try {
      Reference ref = FirebaseStorage.instance.ref().child(
          "ogrt_foto/" + this.kadi_Akad + ".png");
      resim_url = await ref.getDownloadURL().then((value) => value);
    } catch (e) {
      debugPrint("Akademisyen resmi geitirlimedi");
    }

    var dersler = await firestore_akademisyen
        .doc("teachers/" + dokuman_id + "/dersler/girilen_dersler")
        .get();
    dersler.data().forEach((key, value) {
      ders_no.add(key);
      ders_adlari.add(value);
    });
    return ders_adlari;
  }

  Future sifreDegisitir(String akad_kadi, String eski_sifre, String yeni_sifre,
      String yeni_sifre_tekrari) async {
    try {
      var akad = await firestore_akademisyen.collection("teachers").where(
          "k_adi", isEqualTo: akad_kadi).get();
      akad.docs.forEach((element) {
        akad_id = element.id;
        sifre_Akad = element.data()["sifre"];
        debugPrint("AKAD ID: " + element.id);
      });
      if (eski_sifre == sifre_Akad && (yeni_sifre == yeni_sifre_tekrari)) {
        await firestore_akademisyen.collection("teachers").doc(akad_id).set(
            {"sifre": yeni_sifre}, SetOptions(merge: true)).then((value) =>
        degisiklik = true);

        debugPrint("degisiklik: " + degisiklik.toString());
      } else if (eski_sifre != sifre_Akad) {
        mesaj = "Eski şifreniz doğru girilmedi";
        degisiklik = false;
      } else if (yeni_sifre_tekrari != yeni_sifre) {
        mesaj = "yeni şifren biribiriyle uyuşmuyor.";
        degisiklik = false;
      } else {
        mesaj = "Girdiğiniz bütün değerler yanlış";
        degisiklik = false;
      }
      debugPrint("İşlem mesajı: " + mesaj);
    } catch (e) {
      debugPrint(
          "HATA ALDIK: AKADEMİSYEN SERİVİSİ ŞİFRE DEĞİŞTİRME: " + e.toString());
    }
  }

  Future OgrenimBilgisiCek(String akad_kadi) async {

    var k_adi = await firestore_akademisyen.collection("teachers")
        .where("k_adi", isEqualTo: "ACC").get();
    k_adi.docs.forEach((element) {
      kadi_Akad = element.id;
    });
    var akad_gorev=await firestore_akademisyen.collection("teachers").doc(kadi_Akad).
    collection("akademik_gorev_listesi").get();
    akad_gorev.docs.forEach((element) {
      akad_gorevListesi.add(element.data());

    });
    for(int i=0;i<dizi.length;i++){
      var ogrenim_bilgisi = await firestore_akademisyen.collection("teachers")
          .doc(kadi_Akad)
          .collection("ogrenim_bilgisi").doc(dizi.elementAt(i)).get();
      ogrenim_bilgileri.add(ogrenim_bilgisi.data());
    }
    
  }

}
