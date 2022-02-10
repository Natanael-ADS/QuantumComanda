class User {
  int id;
  String name;
  String password;
  bool isLogged;

  User({
    this.id = 0,
    required this.name,
    required this.password,
    this.isLogged = false,
  });
}
