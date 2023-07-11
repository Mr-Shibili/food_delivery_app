class UserModel {
  String? email, username, phone, profile, dateofbirth, gender;
  UserModel(
      {this.email,
      this.username,
      this.phone,
      this.profile,
      this.dateofbirth,
      this.gender});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      email: json['data']["email"],
      username: json['data']["username"],
      phone: json['data']["phone"],
      profile: json['data']["profile"],
      dateofbirth: json['data']['dob'],
      gender: json['data']['gender']);
}
