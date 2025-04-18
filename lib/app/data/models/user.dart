class User {
  final String accessToken;
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  const User({
    required this.accessToken,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic>? json) {
    return User(
      accessToken: json?['token'] ?? '',
      id: json?['_id'] ?? '',
      firstName: json?['firstName'] ?? '',
      lastName: json?['lastName'] ?? '',
      email: json?['email'] ?? '',
      phone: json?['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'token': accessToken,
    '_id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phoneNumber': phone,
  };

  User addToken(String? token) => User(
    accessToken: token ?? accessToken,
    id: id,
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
  );
}
