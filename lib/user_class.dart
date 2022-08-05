class User {
  final String name;
  final String age;
  final String gender;

  User({required this.name, required this.age, required this.gender});

  static User fromJson(json) =>
      User(name: json["name"], age: json["age"], gender: json["gender"]);
}
