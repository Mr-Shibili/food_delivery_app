class EditProfileModel {
  String? username, dateofbirth, gender;
  EditProfileModel(
      {required this.username,
      required this.dateofbirth,
      required this.gender});

  Map<String, dynamic> toJson() => {
        "usename": username,
        "dateofbirth": dateofbirth,
        "gender": gender,
      };
}
