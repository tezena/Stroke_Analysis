import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/services.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:final_sprs/data/dataProviders/userDataCollector.dart';

class StepContactInformation extends StatefulWidget {
  final UserDataCollector userDataCollector;
  StepContactInformation({required this.userDataCollector});
  @override
  _StepContactInformationState createState() => _StepContactInformationState();
}

class _StepContactInformationState extends State<StepContactInformation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _countryController.dispose();
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
            "Contact Information",
            style: theme.textTheme.displaySmall!
                .copyWith(fontSize: 26), // Add your custom style here
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 30),
          TextFormField(
            controller: widget.userDataCollector.emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: CustomTextStyles.titleMediumPoppinsBlack900,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                ),
              ),
              suffixIcon: Icon(Icons.email,
                  color: theme.colorScheme.primary), // Add email icon
            ),
            validator: MultiValidator([
              RequiredValidator(errorText: 'Email is required'),
              EmailValidator(errorText: 'Enter a valid email address'),
            ]),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: widget.userDataCollector.phoneController,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              labelStyle: CustomTextStyles.titleMediumPoppinsBlack900,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                ),
              ),
              suffixIcon: Icon(Icons.phone,
                  color: theme.colorScheme.primary), // Add phone icon
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: widget.userDataCollector.addressController,
            decoration: InputDecoration(
              labelText: 'Address',
              labelStyle: CustomTextStyles.titleMediumPoppinsBlack900,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                ),
              ),
              suffixIcon: Icon(Icons.home,
                  color: theme.colorScheme.primary), // Add address icon
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: widget.userDataCollector.cityController,
            decoration: InputDecoration(
              labelText: 'City',
              labelStyle: CustomTextStyles.titleMediumPoppinsBlack900,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                ),
              ),
              suffixIcon: Icon(
                Icons.location_city,
                color: theme.colorScheme.primary,
              ), // Add city icon
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: widget.userDataCollector.countryController,
            decoration: InputDecoration(
              labelText: 'Country',
              labelStyle: CustomTextStyles.titleMediumPoppinsBlack900,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                ),
              ),
              suffixIcon: Icon(Icons.location_on,
                  color: theme.colorScheme.primary), // Add country icon
            ),
          ),
        ],
      ),
    );
  }
}
