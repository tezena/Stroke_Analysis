import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:final_sprs/presentaion/screens/Drawer.dart';
import 'package:final_sprs/resource/DisplayForm.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:final_sprs/presentaion/widgets/RiskAssessmentDisplayer.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  int currentStep = 1;
  FormData formData = FormData();
  bool isStarted = false;

  void updateFormData(Map<String, dynamic> newData) {
    setState(() {
      if (newData.containsKey('gender')) {
        formData.gender = newData['gender'];
      }
      if (newData.containsKey('Age')) {
        formData.age = newData['Age'];
      }

      if (newData.containsKey('hypertension')) {
        formData.hypertension = newData['hypertension'];
      }
      if (newData.containsKey('heartDisease')) {
        formData.heartDisease = newData['heartDisease'];
      }

      if (newData.containsKey('everMarried')) {
        formData.everMarried = newData['everMarried'];
      }
      if (newData.containsKey('workType')) {
        formData.workType = newData['workType'];
      }
      if (newData.containsKey('residence')) {
        formData.residenceType = newData['residence'];
      }
      if (newData.containsKey('smokingStatus')) {
        formData.smokingStatus = newData['smokingStatus'];
      }
      if (newData.containsKey('glucoseLevel')) {
        formData.avgGlucoseLevel = newData['glucoseLevel'];
      }
      if (newData.containsKey('bmi')) {
        formData.bmi = newData['bmi'];
      }
    });
  }

  void goToPreviousStep() {
    if (currentStep > 1) {
      setState(() {
        currentStep--;
      });
    }
  }

  void goToNextStep() {
    if (currentStep < 6) {
      setState(() {
        currentStep++;
      });
    }
  }

  void setInitil() {
    setState(() {
      currentStep = 1;
    });
  }

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController agevalueoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
            width: mediaQueryData.size.width,
            height: mediaQueryData.size.height,
            decoration: BoxDecoration(
                color: appTheme.whiteA700,
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgGroup57),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 100.v),
                child: !isStarted
                    ? Align(
                        alignment: Alignment.center,
                        child: Container(
                            width: 310.h,
                            height: 340.h,
                            margin: const EdgeInsets.only(top: 100, bottom: 0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 33.h, vertical: 8.v),
                            decoration: AppDecoration.fillCyan,
                            child: Column(children: [
                              SizedBox(height: 20.v),
                              CustomImageView(
                                  imagePath: ImageConstant.imgImage4,
                                  height: 100.adaptSize,
                                  width: 80.adaptSize),
                              SizedBox(height: 5.v),
                              Text("NeuroGen",
                                  style: CustomTextStyles
                                      .titleLargeOpenSansBluegray800
                                      .copyWith()),
                              SizedBox(height: 10.v),
                              Text(
                                "Prevention is the best cure. Know your risk factors and take action, Stroke awareness today, a healthier tomorrow. ",
                                maxLines: 20,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall!
                                    .copyWith(height: 1.40, fontSize: 12),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: 30.v),
                              CustomElevatedButton(
                                text: "Start",
                                width: 120.h,
                                buttonStyle: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        theme.colorScheme.primary)),
                                buttonTextStyle: theme.textTheme.labelLarge!
                                    .copyWith(
                                        fontSize: 16, color: Colors.white),
                                onTap: () {
                                  setState(() {
                                    isStarted = true;
                                  });
                                },
                              ),
                              SizedBox(height: 10.v),
                            ])))
                    : currentStep != 5
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                SizedBox(
                                  height: 100.h,
                                ),
                                Container(
                                    width: 332.h,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 48.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 33.h, vertical: 8.v),
                                    decoration: AppDecoration.fillCyan.copyWith(
                                        color: Color.fromRGBO(25, 38, 85, .98)),
                                    child: Column(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgImage4,
                                          height: 35.adaptSize,
                                          width: 35.adaptSize),
                                      SizedBox(height: 5.v),
                                      Text("NeuroGen",
                                          style: CustomTextStyles
                                              .titleLargeOpenSansBluegray800),
                                      SizedBox(height: 10.v),
                                      Text("Risk Assessment Prediction",
                                          style: theme.textTheme.labelLarge),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                              width: 240.h,
                                              margin: EdgeInsets.only(
                                                  top: 12.v, right: 25.h),
                                              child: Text(
                                                  "Prevention is the best cure. Know your risk factors and take action.",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: theme
                                                      .textTheme.bodySmall!
                                                      .copyWith(
                                                          height: 1.40,
                                                          color:
                                                              Colors.white)))),
                                      StepWidget(
                                        currentStep: currentStep,
                                        formData: formData,
                                        updateFormData: updateFormData,
                                        goToPreviousStep: goToPreviousStep,
                                        goToNextStep: goToNextStep,
                                      ),
                                      SizedBox(height: 6.v)
                                    ])),
                                SizedBox(height: 167.v),
                              ])
                        // diplayer here .........
                        : Center(
                            child: RiskAssesmentDisplayer(
                              setIntial: setInitil,
                              formData: formData,
                            ),
                          ))));
  }

  onTapGonext(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.chatTwoScreen);
  }
}
