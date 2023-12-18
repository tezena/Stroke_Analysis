import 'package:final_sprs/logic/DashBoard/bloc/dash_board_bloc_bloc.dart';
import 'package:final_sprs/logic/login/bloc/login_block_bloc.dart';
import 'package:final_sprs/main.dart';
import 'package:final_sprs/presentaion/screens/register_screen.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/retry.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool? _isBtn1Taped;
  @override
  void initState() {
    super.initState();
    _isBtn1Taped = false;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child: Form(
              key: _formKey,
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 31.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Login here",
                            style:
                                CustomTextStyles.headlineLargePoppinsPrimary),
                        SizedBox(height: 22.v),
                        SizedBox(
                            width: 228.h,
                            child: Text("Welcome back you’ve\nbeen missed!",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles
                                    .titleLargePoppinsErrorContainer)),
                        CustomTextFormField(
                            controller: emailController,
                            margin: EdgeInsets.only(top: 75.v, right: 9.h),
                            hintText: "Email",
                            hintStyle: CustomTextStyles.titleMediumGray700,
                            textInputType: TextInputType.emailAddress),
                        CustomTextFormField(
                          controller: passwordController,
                          margin: EdgeInsets.only(top: 29.v, right: 9.h),
                          hintText: "Password",
                          hintStyle: CustomTextStyles.titleMediumGray700,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(top: 31.v, right: 9.h),
                                child: Text("Forgot your password?",
                                    style: theme.textTheme.titleSmall))),
                        BlocConsumer<LoginBlockBloc, LoginState>(
                            bloc: BlocProvider.of(context),
                            listener: (context, state) {
                              if (state is LoginSuccessState) {
                                final dashBoardBloc =
                                    BlocProvider.of<DashBoardBloc>(context);
                                dashBoardBloc.add(userLoggedIn());

                                Navigator.of(context)
                                    .pushReplacementNamed("/Dashboard");
                              }
                            },
                            builder: (context, state) {
                              if (state is LoginLoadingState) {
                                return CircularProgressIndicator();
                              } else if (state is LoginFailureState) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "An error occurred. Please try again."),
                                    ),
                                  );
                                });

                                Future.delayed(Duration(seconds: 1));

                                return CustomElevatedButton(
                                  height: 60.v,
                                  text: "Sign in",
                                  margin:
                                      EdgeInsets.only(top: 28.v, right: 9.h),
                                  buttonStyle: CustomButtonStyles.outlineBlue,
                                  buttonTextStyle:
                                      CustomTextStyles.titleLargePoppins,
                                  onTap: () async {
                                    // await _login(context);
                                    var temp = BlocProvider.of<LoginBlockBloc>(
                                      context,
                                    );
                                    temp.add(LoginButtonPressed(
                                        email: emailController.text,
                                        password: passwordController.text));
                                  },
                                );
                              } else {
                                return CustomElevatedButton(
                                  height: 60.v,
                                  text: "Sign in",
                                  margin:
                                      EdgeInsets.only(top: 28.v, right: 9.h),
                                  buttonStyle: CustomButtonStyles.outlineBlue,
                                  buttonTextStyle:
                                      CustomTextStyles.titleLargePoppins,
                                  onTap: () async {
                                    // await _login(context);
                                    var temp = BlocProvider.of<LoginBlockBloc>(
                                      context,
                                    );
                                    temp.add(LoginButtonPressed(
                                        email: emailController.text,
                                        password: passwordController.text));
                                  },
                                );
                              }
                            }),
                        CustomElevatedButton(
                            height: _isBtn1Taped! ? 60.v : 41.v,
                            text: "Create new account",
                            margin: EdgeInsets.only(top: 30.v, right: 9.h),
                            buttonStyle: CustomButtonStyles.fillWhiteA,
                            buttonTextStyle: CustomTextStyles.titleSmallGray800,
                            onTap: () async {
                              _isBtn1Taped = true;
                              await Future.delayed(const Duration(seconds: 1));
                              Navigator.of(context).pushNamed('/register');
                            }),
                        SizedBox(height: 64.v),
                        Text("Or continue with",
                            style: theme.textTheme.titleSmall),
                        SizedBox(height: 20.v),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgPhgooglelogobold,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize),
                              CustomImageView(
                                  svgPath: ImageConstant.imgIcsharpfacebook,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize),
                              CustomImageView(
                                  svgPath: ImageConstant.imgIcbaselineapple,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize)
                            ]),
                        SizedBox(height: 5.v)
                      ])))),
    );
  }

  onTapCreatenew(BuildContext context) {
    Navigator.pushNamed(context, "");
  }

  void showErrorSnackBar(BuildContext context, String s) {}
}
