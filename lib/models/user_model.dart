class Users {
  final String? uid;
  final String? login;
  final String? email;
  final String? password;

  Users({this.uid, this.login, this.email, this.password});

  Users.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        login = json['login'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'login': login,
        'email': email,
        'password': password,
      };
}
