class User {
  final int? id;
  late final String first_name;
  late final String last_name;
  late final String username;
  late final String mobile_number;
  late final String email_id;
  late final String password;

  User({
    this.id,
    required this.first_name,
    required this.last_name,
    required this.username,
    required this.mobile_number,
    required this.email_id,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      username: map['username'],
      mobile_number: map['mobile_number'], // Corrected key
      email_id: map['email_id'], // Corrected key
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'first_name': first_name,
      'last_name': last_name,
      'username': username,
      'mobile_number': mobile_number,
      'email_id': email_id,
      'password': password,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
