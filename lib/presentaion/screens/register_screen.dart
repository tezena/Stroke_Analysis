import 'package:final_sprs/data/dataProviders/userDataCollector.dart';
import 'package:final_sprs/logic/registration/bloc/registration_bloc.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_sprs/presentaion/widgets/dialogBox.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late UserDataCollector userDataCollector;
  final dialogBox = DialogBox();

  @override
  void initState() {
    super.initState();
    userDataCollector = UserDataCollector();
  }

  int _currentStep = 0;
  List<Widget> _steps = [];

  void _next() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _back() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _steps = [
      StepPersonalInformation(userDataCollector: userDataCollector),
      StepContactInformation(userDataCollector: userDataCollector),
      StepPassword(userDataCollector: userDataCollector),
    ];

    mediaQueryData = MediaQuery.of(context);
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      bloc: BlocProvider.of(context),
      listener: (context, state) {
        if (state is RegistrationSuccessState) {
          dialogBox.dialogBuilder1(context);
        }
        if (state is RegistrationErrorState) {
          dialogBox.dialogBuilder2(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Container(
                width: mediaQueryData.size.width,
                decoration: BoxDecoration(
                    color: appTheme.whiteA700,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgGroup57),
                        fit: BoxFit.cover)),
                padding: EdgeInsets.symmetric(horizontal: 31.h),
                child: state is RegistrationLoadingState
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(children: <Widget>[
                        SizedBox(
                          height: 150.v,
                        ),
                        StepProgressIndicator(
                          totalSteps: _steps.length,
                          currentStep: _currentStep + 1,
                          size: 3,
                          selectedColor: theme.colorScheme.primary,
                          unselectedColor: appTheme.blueGray400,
                          selectedSize: 3,
                          roundedEdges: Radius.circular(100),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: _steps[_currentStep],
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_currentStep > 0)
                              ElevatedButton(
                                onPressed: _back,
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        theme.colorScheme.primary)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 10, left: 10),
                                  child: Text('Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16)),
                                ),
                              ),
                            ElevatedButton(
                              onPressed: _currentStep < _steps.length - 1
                                  ? _next
                                  : () async {
                                      final userData =
                                          userDataCollector.collectUserData();
                                      BlocProvider.of<RegistrationBloc>(context)
                                          .add(PostUserDataEvent(
                                              userData: userData));
                                    },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      theme.colorScheme.primary)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, right: 10, left: 10),
                                child: Text(
                                  _currentStep < _steps.length - 1
                                      ? 'Next'
                                      : "Register",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ])));
      },
    );
  }
}
