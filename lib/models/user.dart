
class User {
  final String name;
  final int age;
  final String profileImage;

  User({required this.name, required this.age, required this.profileImage});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
      profileImage: json['profileImage'],
    );
  }
}