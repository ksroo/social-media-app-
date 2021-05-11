class UserModel {
  String name;
  String email;
  String phone;
  String uId;
  String image;
  String cover;
  String bio;
  bool isEmailVerified;

  UserModel(
      {this.email,
      this.name,
      this.phone,
      this.uId,
      this.isEmailVerified,
      this.bio,
      this.image,
      this.cover});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    bio = json['bio'];
    cover = json['cover'];
    isEmailVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'bio': bio,
      'image': image,
      'cover': cover,
      'isEmailVerified': isEmailVerified,
    };
  }
}
