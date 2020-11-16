class User{
  String id_user,code, first_name, last_name, email, gender, password, year, filiere, penality,profile,photo;

  User({
      this.id_user,
      this.code,
      this.first_name,
      this.last_name,
      this.email,
      this.gender,
      this.password,
      this.year,
      this.filiere,
      this.penality,
      this.profile,
  this.photo});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id_user: json['id_user'] as String,
      code: json['code'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      password: json['password'] as String,
      year: json['year'] as String,
      filiere: json['filiere'] as String,
      penality: json['penality'] as String,
      profile: json['profile'] as String,
        photo:json['photo'] as String,
    );
  }
}
