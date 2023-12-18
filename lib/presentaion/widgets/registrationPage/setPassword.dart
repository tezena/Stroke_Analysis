import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:final_sprs/data/dataProviders/userDataCollector.dart';

class StepPassword extends StatefulWidget {
  final UserDataCollector userDataCollector;
  StepPassword({required this.userDataCollector});
  @override
  _StepPasswordState createState() => _StepPasswordState();
}

class _StepPasswordState extends State<StepPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Account Information",
        style: theme.textTheme.displaySmall!.copyWith(fontSize: 26),
        textAlign: TextAlign.start,
      ),
      SizedBox(height: 30),
      TextFormField(
        controller: widget.userDataCollector.passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: CustomTextStyles.titleMediumPoppinsBlack900,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          suffixIcon: IconButton(
            icon: _isPasswordVisible
                ? Icon(Icons.visibility, color: theme.colorScheme.primary)
                : Icon(Icons.visibility_off,
                    color: theme.colorScheme.primary),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
        obscureText: !_isPasswordVisible,
        validator: MultiValidator([
          RequiredValidator(errorText: 'Password is required'),
          MinLengthValidator(8, errorText: 'Password is too short'),
        ]),
      ),
      SizedBox(height: 20),
      TextFormField(
        controller: _confirmPasswordController,
        decoration: InputDecoration(
          labelText: 'Confirm Password',
          labelStyle: CustomTextStyles.titleMediumPoppinsBlack900,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          suffixIcon: IconButton(
            icon: _isConfirmPasswordVisible
                ? Icon(Icons.visibility, color: theme.colorScheme.primary)
                : Icon(Icons.visibility_off,
                    color: theme.colorScheme.primary),
            onPressed: () {
              setState(() {
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              });
            },
          ),
        ),
        obscureText: !_isConfirmPasswordVisible,
        validator: (value) {
          if (value != _passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
      ),
    ],
      ),
    );
  }
}
