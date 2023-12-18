class UserData {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String phoneNumber;
  final String address;
  final String city;
  final int age;
  final String gender;
  final String country;

  UserData({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.age,
    required this.gender,
    required this.country,
  });

  // Factory constructor to parse JSON data
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'],
      password: json['password'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      dateOfBirth: json['date_of_birth'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      city: json['city'],
      age: json['age'],
      gender: json['gender'],
      country: json['country'],
    );
  }

  // Convert the UserData to a JSON map for POST request
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth,
      'phone_number': phoneNumber,
      'address': address,
      'city': city,
      'age': age,
      'gender': gender,
      'country': country,
    };
  }
}
