class UserSignupModel {
  final String username;
  final String email;
  final String location;
  final String password;
  final String confirmPassword;
  final String enteredOtp;
  final String uId;

  UserSignupModel(
      {required this.username,
      required this.email,
      required this.location,
      required this.password,
      required this.confirmPassword,
      required this.enteredOtp,
      required this.uId});

  factory UserSignupModel.fromJson(Map<String, dynamic> json) {
    return UserSignupModel(
      uId: json['uId'],
      enteredOtp: json['enteredOtp'],
      username: json['username'],
      email: json['email'],
      location: json['location'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'location': location,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
