import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:final_sprs/data/dataProviders/userDataCollector.dart';

class StepPersonalInformation extends StatefulWidget {
  final UserDataCollector userDataCollector;
  StepPersonalInformation({required this.userDataCollector});
  @override
  _StepPersonalInformationState createState() =>
      _StepPersonalInformationState();
}

class _StepPersonalInformationState extends State<StepPersonalInformation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  String? gender;

  @override
  void dispose() {
    _dateOfBirthController.dispose();
    _ageController.dispose();
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
        "personal Information",
        style: theme.textTheme.displaySmall!.copyWith(fontSize: 26),
        textAlign: TextAlign.start,
      ),
      SizedBox(
        height: 30,
      ),
      TextFormField(
        controller: widget.userDataCollector.firstNameController,
        decoration: InputDecoration(
            labelText: 'First Name',
            labelStyle: CustomTextStyles.titleMediumPoppinsBlack900,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              width: 1,
            ))),
        validator: (value) {
          if (value!.isEmpty) {
            return 'First Name is required';
          }
          return null;
        },
      ),
      SizedBox(
        height: 20,
      ),
      TextFormField(
        controller: widget.userDataCollector.lastNameController,
        decoration: InputDecoration(
            labelText: 'Last Name',
            labelStyle: CustomTextStyles.titleMediumPoppinsBlack900,
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(width: 1))),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Last Name is required';
          }
          return null;
        },
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        children: [
          Text(
            'Gender:',
            style: CustomTextStyles.titleMediumPoppinsBlack900,
          ),
          Radio(
            value: 'male',
            fillColor: MaterialStatePropertyAll(theme.colorScheme.primary),
            focusColor: theme.colorScheme.primary,
            groupValue: widget.userDataCollector.genderController,
            onChanged: (value) {
              setState(() {
                widget.userDataCollector.genderController = value;
              });
            },
          ),
          Text(
            'Male',
            style: TextStyle(fontSize: 18),
          ),
          Radio(
            value: 'female',
            groupValue: widget.userDataCollector.genderController,
            fillColor: MaterialStatePropertyAll(theme.colorScheme.primary),
            focusColor: theme.colorScheme.primary,
            onChanged: (value) {
              setState(() {
                widget.userDataCollector.genderController = value;
              });
            },
          ),
          Text(
            'Female',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      TextFormField(
        controller: widget.userDataCollector.dateOfBirthController,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.calendar_today,
                color: theme.colorScheme.primary),
            labelText: 'Date of Birth',
            labelStyle: CustomTextStyles.titleMediumPoppinsBlack900,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              width: 1,
            ))),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Date of Birth is required';
          }
          return null;
        },
        onTap: () {
          _selectDate(context);
        },
      ),
      SizedBox(
        height: 20,
      ),
      TextFormField(
        controller: widget.userDataCollector.ageController,
        decoration: InputDecoration(
            labelText: 'Age',
            labelStyle: CustomTextStyles.titleMediumPoppinsBlack900,
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(width: 1))),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Age is required';
          }
          return null;
        },
      ),
    ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      widget.userDataCollector.dateOfBirthController.text =
          DateFormat('MM/dd/yyyy').format(picked);
      final age = DateTime.now().year - picked.year;
      widget.userDataCollector.ageController.text = age.toString();
    }
  }
}
