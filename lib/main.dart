import 'package:final_sprs/logic/DashBoard/bloc/dash_board_bloc_bloc.dart';
import 'package:final_sprs/logic/chat/bloc/chat_bloc.dart';
import 'package:final_sprs/logic/login/bloc/login_block_bloc.dart';
import 'package:final_sprs/logic/registration/bloc/registration_bloc.dart';
import 'package:final_sprs/logic/userProfile/bloc/user_profile_bloc.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:final_sprs/presentaion/screens/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_sprs/presentaion/screens/profile_Screen.dart';
import 'package:final_sprs/presentaion/screens/drawer_new.dart';
import "package:flutter/material.dart";
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LoginBlockBloc loginBloc = LoginBlockBloc();
  final DashBoardBloc dashBoardBloc = DashBoardBloc();
  final RegistrationBloc registretionBloc = RegistrationBloc();
  final UserProfileBloc profileBloc = UserProfileBloc();
  final ChatBloc chatBloc = ChatBloc();
  final bool _islogged = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: loginBloc,
                ),
                BlocProvider.value(value: dashBoardBloc)
              ],
              child: LoginScreen(),
            ),
        '/register': (context) => BlocProvider.value(
            value: registretionBloc, child: RegisterScreen()),
        '/Dashboard': (context) => MultiBlocProvider(providers: [
              BlocProvider.value(value: dashBoardBloc),
              BlocProvider.value(value: profileBloc),
              BlocProvider.value(value: chatBloc)
            ], child: Dashboard()),
        '/profile': (context) => BlocProvider.value(
              value: profileBloc,
              child: ProfileScreen(),
            )
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

Color mainColor = const Color.fromRGBO(25, 38, 85, 1);

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget? _child;

  @override
  void initState() {
    _child = const DashBoard();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = const InputForm();
          break;
        case 1:
          _child = const DashBoard();
          break;
        case 2:
          _child = const Chat();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 100),
        child: _child,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      drawer: NewDrawer(),
      appBar: CustomAppBar(
          height: 80,
          leadingWidth: 60.h,
          leading: AppbarImage1(
              onTap: () {
                // _scaffoldKey.currentState!.openDrawer();
                _scaffoldKey.currentState!.openDrawer();
              },
              svgPath: ImageConstant.imgMenu,
              margin: EdgeInsets.only(left: 14.h, top: 5.v, bottom: 40.v)),
          centerTitle: true,
          title: AppbarTitle(
              text: _selectedIndex == 1
                  ? "DashBoard"
                  : _selectedIndex == 2
                      ? "Chat"
                      : "Risk Assessment",
              margin: EdgeInsets.only(top: 5.v, bottom: 40.v)),
          styleType: Style.bgFill),
      body: _child,
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(icon: MdiIcons.dataMatrix, extras: {"label": "home"}),
          FluidNavBarIcon(icon: MdiIcons.home, extras: {"label": "account"}),
          FluidNavBarIcon(icon: MdiIcons.chat, extras: {"label": "settings"}),
        ],
        onChange: _handleNavigationChange,
        style: FluidNavBarStyle(
            iconSelectedForegroundColor: Colors.white,
            iconUnselectedForegroundColor: Colors.white,
            iconBackgroundColor: mainColor,
            barBackgroundColor: mainColor),
        scaleFactor: 1.5,
        defaultIndex: 1,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras!["label"],
          child: item,
        ),
      ),
    );
  }
}
