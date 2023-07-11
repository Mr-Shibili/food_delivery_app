class Post {
  Post({
    this.userName,
    this.email,
    this.mobile,
    this.password,
  });

  int? userName;
  int? email;
  String? mobile;
  String? password;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        email: json["email"],
        userName: json["userName"],
        mobile: json["mobile"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "userName": userName,
        "mobile": mobile,
        "password": password,
      };
}
