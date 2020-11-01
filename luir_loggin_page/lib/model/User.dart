class User {
  String id_user, first_name,last_name, email, password,penalty,gender, profile;

  User(
      {this.id_user,
        this.first_name,
        this.last_name,
        this.email,
        this.password,
        this.penalty,
        this.gender,
        this.profile});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id_user: json['id_user'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      penalty: json['penalty'] as String,
      gender: json['gender'] as String,
      profile: json['profile'] as String,
    );
  }
}
