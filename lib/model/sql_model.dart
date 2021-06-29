class Hakkinda_Metni{
   String metin;
   int id;
  Hakkinda_Metni({this.id,this.metin});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["metin"] = metin;
    return map;
  }

  Hakkinda_Metni.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    metin = map["metin"];
  }

}