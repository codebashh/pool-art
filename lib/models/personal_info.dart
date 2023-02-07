import 'dart:convert';

class PersonalInfo {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  PersonalInfo({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
  });

  PersonalInfo copyWith({
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
  }) {
    return PersonalInfo(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
    };
  }

  factory PersonalInfo.fromMap(Map<String, dynamic> map) {
    return PersonalInfo(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonalInfo.fromJson(String source) =>
      PersonalInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PersonalInfo(firstName: $firstName, lastName: $lastName, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(covariant PersonalInfo other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.phone == phone &&
        other.email == email;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        phone.hashCode ^
        email.hashCode;
  }
}
