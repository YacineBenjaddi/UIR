import 'dart:convert';

List<horraire_foot> footFromJson(String str) =>
    List<horraire_foot>.from(json.decode(str).map((x) => horraire_foot.fromMap(x)));

String footToJson(List<horraire_foot> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class horraire_foot {
  String id_foot;
  String creneau;
  String disponibilite;
  horraire_foot({
    this.id_foot,
   this.creneau,
   this.disponibilite});

  factory horraire_foot.fromMap(Map<String, dynamic> json) => horraire_foot(
    id_foot: json["id_foot"],
    creneau: json["creneau"],
    disponibilite: json["disponibilite"],
  );

  Map<String, dynamic> toJson() => {
    "id_foot": id_foot,
    "creneau": creneau,
    "disponibilite": disponibilite,
  };
}
