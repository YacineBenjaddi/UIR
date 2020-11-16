class Photo{
  String id_photo,nom;

  Photo({
    this.id_photo,
    this.nom,
  });
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id_photo: json['id_photo'] as String,
      nom: json['nom'] as String,
    );
  }
}
