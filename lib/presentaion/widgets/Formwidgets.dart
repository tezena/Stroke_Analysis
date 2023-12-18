import 'package:final_sprs/logic/DashBoard/bloc/dash_board_bloc_bloc.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:final_sprs/resource/FormData.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepWidget extends StatelessWidget {
  final int currentStep;
  final FormData formData;
  final Function(Map<String, dynamic>) updateFormData;
  final VoidCallback goToPreviousStep;
  final VoidCallback goToNextStep;
  const StepWidget({
    super.key,
    required this.currentStep,
    required this.formData,
    required this.updateFormData,
    required this.goToPreviousStep,
    required this.goToNextStep,
  });

  @override
  Widget build(BuildContext context) {
    switch (currentStep) {
      case 1:
        return Step1(
          formData: formData,
          updateFormData: updateFormData,
          goToNextStep: goToNextStep,
        );
      case 2:
        return Step2(
          formData: formData,
          updateFormData: updateFormData,
          goToPreviousStep: goToPreviousStep,
          goToNextStep: goToNextStep,
        );
      case 3:
        return Step3(
          formData: formData,
          updateFormData: updateFormData,
          goToPreviousStep: goToPreviousStep,
          goToNextStep: goToNextStep,
        );
      case 4:
        return Step4(
          formData: formData,
          updateFormData: updateFormData,
          goToPreviousStep: goToPreviousStep,
          goToNextStep: goToNextStep,
        );

      default:
        return Container();
    }
  }
}

class Step1 extends StatelessWidget {
  List<String> dropdownItemList = ["Male", "Female"];

  final TextEditingController _agevalueoneController =
      TextEditingController(text: "21");
  final FormData formData;
  final Function(Map<String, dynamic>) updateFormData;
  final Function goToNextStep;
  List<String> dropdownItemList2 = [
    "Yes",
    "No",
  ];

  Step1({
    super.key,
    required this.formData,
    required this.updateFormData,
    required this.goToNextStep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 7.v),
                  child: Text("Gender",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          CustomDropDown(
              textStyle: TextStyle(fontSize: 16),
              icon: Container(
                  margin: EdgeInsets.only(left: 30.h, right: 26.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIcon,
                    color: Colors.white,
                  )),
              margin: EdgeInsets.only(left: 6.h, top: 16.v, right: 6.h),
              hintText: "Male",
              hintStyle: TextStyle(color: theme.colorScheme.primary),
              items: dropdownItemList,
              onChanged: (value) {
                updateFormData({"gender": value});
              }),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 11.v),
                  child: Text("Age",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          SizedBox(
            width: 250.h,
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _agevalueoneController,
              keyboardType: TextInputType.number,
              cursorColor: theme.colorScheme.primary,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'age is required';
                }
                return null;
              },
              decoration: InputDecoration(
                helperStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Hypertension",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          CustomDropDown(
              textStyle: TextStyle(fontSize: 16),
              icon: Container(
                  margin: EdgeInsets.only(left: 30.h, right: 26.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIcon,
                    color: Colors.white,
                  )),
              margin: EdgeInsets.only(left: 6.h, top: 15.v, right: 6.h),
              hintText: "No",
              hintStyle: TextStyle(color: theme.colorScheme.primary),
              items: dropdownItemList2,
              onChanged: (value) {
                updateFormData({"hypertension": value});
              }),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Heart Disease",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          CustomDropDown(
              textStyle: TextStyle(fontSize: 16),
              icon: Container(
                  margin: EdgeInsets.only(left: 30.h, right: 26.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIcon,
                    color: Colors.white,
                  )),
              margin: EdgeInsets.only(left: 6.h, top: 16.v, right: 6.h),
              hintText: "No",
              hintStyle: TextStyle(color: theme.colorScheme.primary),
              items: dropdownItemList2,
              onChanged: (value) {
                updateFormData({"heartDisease": value});
              }),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
              width: 151.h,
              text: "Go next",
              buttonTextStyle: TextStyle(color: Colors.white),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              rightIcon: Container(
                  margin: EdgeInsets.only(left: 8.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIconPrimarycontainer,
                    color: Colors.white,
                  )),
              onTap: () {
                updateFormData({"Age": int.parse(_agevalueoneController.text)});

                goToNextStep();
              }),
        ],
      ),
    );
  }
}

class Step2 extends StatelessWidget {
  final FormData formData;
  final Function(Map<String, dynamic>) updateFormData;
  final VoidCallback goToPreviousStep;
  final VoidCallback goToNextStep;
  List<String> dropdownItemList = ['Yes', 'No'];

  List<String> dropdownItemList1 = [
    "Self employed",
    "Private",
    "Govt job",
    "Never worked"
  ];

  List<String> dropdownItemList2 = ["Urban", "Rural"];

  List<String> dropdownItemList3 = [
    "Formerly smoked",
    "Never smoked ",
    "Smokes"
  ];

  Step2({
    super.key,
    required this.formData,
    required this.updateFormData,
    required this.goToPreviousStep,
    required this.goToNextStep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 7.v),
                  child: Text("Ever married",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          CustomDropDown(
              textStyle: TextStyle(fontSize: 16),
              icon: Container(
                  margin: EdgeInsets.only(left: 30.h, right: 26.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIcon,
                    color: Colors.white,
                  )),
              margin: EdgeInsets.only(left: 6.h, top: 16.v, right: 6.h),
              hintText: "No",
              hintStyle: TextStyle(color: theme.colorScheme.primary),
              items: dropdownItemList,
              onChanged: (value) {
                updateFormData({"everMarried": value});
              }),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 11.v),
                  child: Text("Work Type",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          CustomDropDown(
              textStyle: TextStyle(fontSize: 16),
              icon: Container(
                  margin: EdgeInsets.only(left: 30.h, right: 26.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIcon,
                    color: Colors.white,
                  )),
              margin: EdgeInsets.only(left: 6.h, top: 14.v, right: 6.h),
              hintText: "self-employed",
              hintStyle: TextStyle(color: theme.colorScheme.primary),
              items: dropdownItemList1,
              onChanged: (value) {
                updateFormData({"workType": value});
              }),
          SizedBox(height: 11.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Residence Type",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          CustomDropDown(
              textStyle: TextStyle(fontSize: 16),
              icon: Container(
                  margin: EdgeInsets.only(left: 30.h, right: 26.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIcon,
                    color: Colors.white,
                  )),
              margin: EdgeInsets.only(left: 6.h, top: 15.v, right: 6.h),
              hintText: "Urban",
              hintStyle: TextStyle(color: theme.colorScheme.primary),
              items: dropdownItemList2,
              onChanged: (value) {
                updateFormData({"residence": value});
              }),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 11.v),
                  child: Text("Smoking Status",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          CustomDropDown(
              textStyle: TextStyle(fontSize: 16),
              icon: Container(
                  margin: EdgeInsets.only(left: 30.h, right: 26.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIcon,
                    color: Colors.white,
                  )),
              margin: EdgeInsets.only(left: 6.h, top: 14.v, right: 6.h),
              hintText: "Smokes",
              hintStyle: TextStyle(color: theme.colorScheme.primary),
              items: dropdownItemList3,
              onChanged: (value) {
                updateFormData({"smokingStatus": value});
              }),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
              width: 151.h,
              text: "Go next",
              buttonTextStyle: TextStyle(color: Colors.white),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              rightIcon: Container(
                  margin: EdgeInsets.only(left: 8.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIconPrimarycontainer,
                    color: Colors.white,
                  )),
              onTap: () {
                goToNextStep();
              }),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
              width: 151.h,
              text: "Go Back",
              buttonTextStyle: TextStyle(color: Colors.white),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              leftIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  MdiIcons.arrowLeftThin,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                goToPreviousStep();
              }),
        ],
      ),
    );
  }
}

class Step3 extends StatelessWidget {
  final FormData formData;
  final Function(Map<String, dynamic>) updateFormData;
  final VoidCallback goToPreviousStep;
  final VoidCallback goToNextStep;
  TextEditingController glucoselevelvalController =
      TextEditingController(text: "150");

  TextEditingController bmivalueoneController =
      TextEditingController(text: "80");

  TextEditingController heightvalueController = TextEditingController();

  TextEditingController weightvaluController = TextEditingController();

  Step3({
    super.key,
    required this.formData,
    required this.updateFormData,
    required this.goToPreviousStep,
    required this.goToNextStep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Average Glucose Level",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          SizedBox(
            width: 250.h,
            child: TextFormField(
              controller: glucoselevelvalController,
              cursorColor: theme.colorScheme.primary,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: theme.colorScheme.primary))),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("BMI",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          SizedBox(
            width: 250.h,
            child: TextFormField(
              controller: bmivalueoneController,
              cursorColor: theme.colorScheme.primary,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: theme.colorScheme.primary))),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Height",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          SizedBox(
            width: 250.h,
            child: TextFormField(
              controller: heightvalueController,
              cursorColor: theme.colorScheme.primary,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: theme.colorScheme.primary))),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Weight",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          SizedBox(
            width: 250.h,
            child: TextFormField(
              controller: weightvaluController,
              cursorColor: theme.colorScheme.primary,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: theme.colorScheme.primary))),
            ),
          ),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
              width: 151.h,
              text: "Go next",
              buttonTextStyle: TextStyle(color: Colors.white),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              rightIcon: Container(
                  margin: EdgeInsets.only(left: 8.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIconPrimarycontainer,
                    color: Colors.white,
                  )),
              onTap: () {
                updateFormData({
                  "glucoseLevel": double.parse(glucoselevelvalController.text)
                });
                updateFormData(
                    {"bmi": double.parse(bmivalueoneController.text)});
                updateFormData({"height": heightvalueController.text});
                updateFormData({"weight": weightvaluController.text});
                goToNextStep();
              }),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
              width: 151.h,
              text: "Go Back",
              buttonTextStyle: TextStyle(color: Colors.white),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              leftIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  MdiIcons.arrowLeftThin,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                goToPreviousStep();
              }),
        ],
      ),
    );
  }
}

class Step4 extends StatelessWidget {
  final FormData formData;
  final Function(Map<String, dynamic>) updateFormData;
  final VoidCallback goToPreviousStep;
  final VoidCallback goToNextStep;
  TextEditingController physicalActivityController = TextEditingController();

  TextEditingController dietvalueController = TextEditingController();
  TextEditingController sybpvalueController =
      TextEditingController(text: "150");

  TextEditingController diastolicvalueoneController =
      TextEditingController(text: "90");

  Step4({
    super.key,
    required this.formData,
    required this.updateFormData,
    required this.goToPreviousStep,
    required this.goToNextStep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Physical Activity",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          SizedBox(
            width: 250.h,
            child: TextFormField(
              controller: physicalActivityController,
              cursorColor: theme.colorScheme.primary,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: theme.colorScheme.primary))),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Diet",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          SizedBox(
            width: 250.h,
            child: TextFormField(
              controller: dietvalueController,
              cursorColor: theme.colorScheme.primary,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: theme.colorScheme.primary))),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Systolic Blood Pressure",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          SizedBox(
            width: 250.h,
            child: TextFormField(
              controller: sybpvalueController,
              cursorColor: theme.colorScheme.primary,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: theme.colorScheme.primary))),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Diastolic Blood Pressure",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          SizedBox(
            width: 250.h,
            child: TextFormField(
              controller: diastolicvalueoneController,
              cursorColor: theme.colorScheme.primary,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: theme.colorScheme.primary))),
            ),
          ),
          SizedBox(height: 11.v),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
              width: 151.h,
              text: "Go next",
              buttonTextStyle: TextStyle(color: Colors.white),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              rightIcon: Container(
                  margin: EdgeInsets.only(left: 8.h),
                  child: CustomImageView(
                      svgPath: ImageConstant.imgIconPrimarycontainer)),
              onTap: () {
                updateFormData(
                    {"physicalActivity": physicalActivityController.text});
                updateFormData({"diet": dietvalueController.text});
                updateFormData(
                    {"diastolicBP": diastolicvalueoneController.text});
                updateFormData({"systolicBP": sybpvalueController.text});
                BlocProvider.of<DashBoardBloc>(context)
                    .add(userTakeAssesment());
                goToNextStep();
              }),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
              width: 151.h,
              text: "Go Back",
              buttonTextStyle: TextStyle(color: Colors.white),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              leftIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  MdiIcons.arrowLeftThin,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                goToPreviousStep();
              }),
        ],
      ),
    );
  }
}

class Step8 extends StatelessWidget {
  final FormData formData;
  final Function(Map<String, dynamic>) updateFormData;
  final VoidCallback goToPreviousStep;
  final VoidCallback goToNextStep;
  TextEditingController sybpvalueController =
      TextEditingController(text: "120");

  TextEditingController diastolicvalueoneController =
      TextEditingController(text: "90");

  Step8({
    super.key,
    required this.formData,
    required this.updateFormData,
    required this.goToPreviousStep,
    required this.goToNextStep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Systolic Blood Pressure",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          SizedBox(
            width: 250.h,
            child: TextFormField(
              controller: sybpvalueController,
              cursorColor: theme.colorScheme.primary,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: theme.colorScheme.primary))),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 6.h, top: 9.v),
                  child: Text("Diastolic Blood Pressure",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white)))),
          SizedBox(
            width: 250.h,
            child: TextFormField(
              controller: diastolicvalueoneController,
              cursorColor: theme.colorScheme.primary,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: theme.colorScheme.primary))),
            ),
          ),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
              width: 151.h,
              text: "Go next",
              rightIcon: Container(
                  margin: EdgeInsets.only(left: 8.h),
                  child: CustomImageView(
                      svgPath: ImageConstant.imgIconPrimarycontainer)),
              onTap: () async {
                goToNextStep();
                updateFormData(
                    {"diastolicBP": diastolicvalueoneController.text});
                updateFormData({"systolicBP": sybpvalueController.text});
                BlocProvider.of<DashBoardBloc>(context)
                    .add(userTakeAssesment());
              }),
          SizedBox(height: 11.v),
          CustomOutlinedButton(
              width: 151.h,
              text: "Go Back",
              leftIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  MdiIcons.arrowLeftThin,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                goToPreviousStep();
              }),
        ],
      ),
    );
  }
}
