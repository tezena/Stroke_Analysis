import 'package:flutter/material.dart';
import 'package:final_sprs/data/models/userDataModel.dart';

class UserDataCollector {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
              String? genderController;
  final TextEditingController countryController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  UserData collectUserData() {
    return UserData(
      email: emailController.text,
      password: passwordController.text,
      phoneNumber: phoneController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      dateOfBirth: dateOfBirthController.text,
      address: addressController.text,
      city: cityController.text,
      age: int.parse(ageController.text),
      gender: genderController!,
      country: countryController.text,
    );
  }
}
