class reservationbasket{
  String id_res,id_user,id_basket,date, creneau_basket, type;

  reservationbasket({
    this.id_res,
    this.id_user,
    this.id_basket,
    this.date,
    this.creneau_basket,
    this.type,

  });
  factory reservationbasket.fromJson(Map<String, dynamic> json) {
    return reservationbasket(
      id_res: json['id_res'] as String,
      id_user: json['id_user'] as String,
      id_basket: json['id_basket'] as String,
      date: json['date'] as String,
      creneau_basket: json['creneau'] as String,
      type: json['numero'] as String,

    );
  }
}
