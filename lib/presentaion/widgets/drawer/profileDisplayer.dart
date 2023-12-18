import 'package:final_sprs/logic/login/bloc/login_block_bloc.dart';
import 'package:final_sprs/logic/userProfile/bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class profileDisplayer extends StatefulWidget {
  const profileDisplayer({super.key});

  @override
  State<profileDisplayer> createState() => _profileDisplayerState();
}

class _profileDisplayerState extends State<profileDisplayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16.h,
        right: 16.h,
        bottom: 16.v,
      ),
      decoration:
          AppDecoration.fillGray.copyWith(color: theme.colorScheme.primary),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8.v),
              height: 44.adaptSize,
              width: 44.adaptSize,
              decoration: BoxDecoration(
                color: appTheme.blueGray100,
                borderRadius: BorderRadius.circular(
                  22.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8.h,
                right: 14.h,
                top: 4.v,
                bottom: 4.v,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Profile name",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: appTheme.whiteA700,
                        fontSize: 18,
                      )),
                  SizedBox(height: 2.v),
                  Text("Admin",
                      style: theme.textTheme.titleLarge!.copyWith(
                          color: appTheme.whiteA700,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            Spacer(),
            DropdownButtonExample()
          ],
        ),
      ),
    );
  }
}

const List<String> list = <String>['Profile', "Log out"];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      disabledHint: Container(),
      icon: const Icon(Icons.more_vert),
      iconSize: 18,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? value) {
        if (value == "Profile") {
          print(value);
          BlocProvider.of<UserProfileBloc>(context).add(LoadProfileEvent());
          Navigator.of(context).pushNamed('/profile');
        } else {
          BlocProvider.of<LoginBlockBloc>(context).add(LoggedOutEvent());
          Navigator.of(context).pushReplacementNamed("/welcome");
        }
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: Container(
              child: Text(value),
            ));
      }).toList(),
    );
  }
}
