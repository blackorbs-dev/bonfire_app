import '../models/user.dart';

class ApiService {

  static Future<User> fetchUser() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network
    return User(
      name: "Angelina",
      age: 28,
      profileImage: "assets/images/picture.png",
    );
  }

}