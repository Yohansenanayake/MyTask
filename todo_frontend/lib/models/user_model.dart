class UserModel {
  final String name;
  final String userId;
  final String email;
  final String password;
  final String FcmToken;

  UserModel({
    required this.name,
    required this.userId,
    required this.email,
    required this.password,
    required this.FcmToken,
  });

  Map<String, dynamic> tojson() {
    return {
      'name': name, 
      'userId': userId,
      'email' : email,
      'password' : password,
      'fcmToken': FcmToken,
      };
  }
}
