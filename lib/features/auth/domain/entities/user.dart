class UserEntity {
  final String email;
  final String password;
  final String? token;
  final String? userId;

  UserEntity({
    required this.email,
    required this.password,
    this.token,
    this.userId,
  });
}
