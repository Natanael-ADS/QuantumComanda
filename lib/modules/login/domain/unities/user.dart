class User {
  int id;
  String name;
  String password;
  bool isLogged;

  User({
    required this.id,
    this.name = "",
    required this.password,
    this.isLogged = false,
  });
}
