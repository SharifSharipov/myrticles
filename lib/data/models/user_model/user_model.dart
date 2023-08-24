import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class Usermodel {
  final int id;
  final String username;
  final String contact;
  final String email;
  final String password;
  final String avatar;
  final String profession;
  final String role;
  final String gender;
  Usermodel(
      {this.id = 0,
      required this.username,
      required this.contact,
      required this.email,
      required this.password,
      required this.avatar,
      required this.profession,
      required this.role,
      required this.gender});
  Usermodel copyWith({
    int? id,
    String? username,
    String? contact,
    String? email,
    String? password,
    String? avatar,
    String? profession,
    String? role,
    String? gender,
  }) {
    return Usermodel(
        id: id ?? this.id,
        username: username ?? this.username,
        contact: contact ?? this.contact,
        email: email ?? this.email,
        password: password ?? this.password,
        avatar: avatar ?? this.avatar,
        profession: profession ?? this.profession,
        role: role ?? this.role,
        gender: gender ?? this.gender);
  }

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    return Usermodel(
      username: json["username"] as String? ?? "",
      contact: json["contact"] as String? ?? "",
      email: json["email"] as String? ?? "",
      password: json["password"] as String? ?? "",
      avatar: json["avatar"] as String? ?? "",
      profession: json["profession"] as String? ?? "",
      role: json["role"] as String? ?? "",
      gender: json["gender"] as String? ?? "",
    );
  }
  Map<String, dynamic> toJson() => {
        "username": username,
        "contact": contact,
        "email": email,
        "password": password,
        "avatar": avatar,
        "profession": profession,
        "role": role,
        "gender": gender
      };
  Future<FormData> getFromdata(XFile file) async {
    String filename = file.path.split('/').last;
    return FormData.fromMap({
      "username": username,
      "contact": contact,
      "email": email,
      "password": password,
      "avatar": await MultipartFile.fromFile(file.path, filename: filename),
      "profession": profession,
      "role": role,
      "gender": gender
    });
  }
}
