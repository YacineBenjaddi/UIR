import 'dart:convert';
List<foot> footFromJson(String str) =>
    List<foot>.from(json.decode(str).map((x) => foot.fromMap(x)));

String footToJson(List<foot> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class foot{
  String id_res,id_user,id_foot,date_res, creneau;

  foot({
    this.id_res,
    this.id_user,
    this.id_foot,
    this.date_res,
    this.creneau

  });

  factory foot.fromMap(Map<String, dynamic> json) => foot(
    id_res: json['id_res'] ,
    id_user: json['id_user'] ,
    id_foot: json['id_foot'] ,
    date_res: json['date_res'] ,
    creneau: json['creneau'] ,
  );

  Map<String, dynamic> toJson() => {
    "id_foot": id_foot,
    "creneau": creneau,
    "id_user": id_user,
    "id_res": id_res,
    "date_res": date_res,

  };
}
