class Loisir{
  String id_loisir,nom,description,latitude,longitude,type,capacite;

  Loisir({
    this.id_loisir,
    this.nom,
    this.description,
    this.latitude,
    this.longitude,
    this.type,
    this.capacite
  });
  factory Loisir.fromJson(Map<String, dynamic> json) {
    return Loisir(
        id_loisir: json['id_loisir'] as String,
        nom: json['nom'] as String,
        description: json['description'] as String,
        latitude: json['latitude'] as String,
        longitude: json['longitude'] as String,
        type: json['type'] as String,
        capacite: json['capacite'] as String
    );
  }
}
