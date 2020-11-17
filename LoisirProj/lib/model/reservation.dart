import 'dart:convert';
List<reservation> footFromJson(String str) =>
    List<reservation>.from(json.decode(str).map((x) => reservation.fromMap(x)));

String footToJson(List<reservation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class reservation{
  String id_res,id_user,id_horaire,date_res,type;

  reservation({
    this.id_res,
    this.id_user,
    this.id_horaire,
    this.type,
    this.date_res,

  });

  factory reservation.fromMap(Map<String, dynamic> json) => reservation(
    id_res: json['id_res'] ,
    id_user: json['id_user'] ,
    id_horaire: json['id_horaire'] ,
    date_res: json['date_res'] ,
    type: json['type'] as String,
  );

  Map<String, dynamic> toJson() => {
    "id_horaire": id_horaire,
    "id_user": id_user,
    "id_res": id_res,
    "date_res": date_res,
    "type":type,

  };
}


/*class reservation{
  String id_res,id_user,id_horaire,date_res,type;

  reservation({
    this.id_res,
    this.id_user,
    this.id_horaire,
    this.date_res,
    this.type,
  });

  factory reservation.fromJson(Map<String, dynamic> json) {
    return reservation(
      id_res: json['id_res'] as String,
      id_user: json['id_user'] as String,
      id_horaire: json['id_horaire'] as String,
      date_res: json['date_res'] as String,
      type: json['type'] as String,
    );
  }
}*/
