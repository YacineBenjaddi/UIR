import 'dart:convert';

List<horaire> horaireFromJson(String str) =>
    List<horaire>.from(json.decode(str).map((x) => horaire.fromMap(x)));

String horaireToJson(List<horaire> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class horaire {
  String id_horaire;
  String creneau;
  horaire({
    this.id_horaire,
   this.creneau});

  factory horaire.fromMap(Map<String, dynamic> json) => horaire(
    id_horaire: json["id_horaire"],
    creneau: json["creneau"],
  );

  Map<String, dynamic> toJson() => {
    "id_horaire": id_horaire,
    "creneau": creneau,
  };
}
