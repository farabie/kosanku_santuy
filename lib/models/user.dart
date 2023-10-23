part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String fullName;

  @override
  String toString() {
    return "{$id} - $fullName, $email";
  }

  const User(
    this.id,
    this.email, {
    this.fullName = "",
  });

  @override
  List<Object?> get props => [
        id,
        email,
        fullName,
      ];
}
