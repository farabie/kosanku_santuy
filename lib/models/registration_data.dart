part of 'models.dart';

class RegistrationData {
  final String fullName;
  final String email;
  final String password;

  RegistrationData({
    this.email = "",
    this.fullName = "",
    this.password = "",
  });
}
