class AppUser {
  final String email;
  final String firstName;
  AppUser({
    required this.email,
    required this.firstName,
  });

  @override
  String toString() => 'AppUser(email: $email, firstName: $firstName)';

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'name': firstName});

    return result;
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      email: map['email'] ?? '',
      firstName: map['name'] ?? '',
    );
  }

  factory AppUser.fromJson(source) => AppUser.fromMap(source);
}
