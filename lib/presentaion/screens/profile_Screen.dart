import 'package:final_sprs/logic/userProfile/bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool editMode = false;
  bool passwordEditMode = false;

  Map<String, dynamic> userData = {
    'first_name': '',
    'last_name': '',
    'gender': '',
    'date_of_birth': '',
    'age': 0,
    'phone_number': '',
    'country': '',
    'city': '',
    'address': '',
  };

  Map<String, dynamic> passwordData = {
    'oldPassword': null,
    'password': null,
    'confirm_password': null,
    'email': '',
  };

  void handleEdit() {
    setState(() {
      editMode = true;
      passwordEditMode = false;
    });
  }

  void handlePasswordEdit() {
    setState(() {
      passwordEditMode = true;
      editMode = false;
    });
  }

  void handleSave() {
    setState(() {
      editMode = false;
      passwordEditMode = false;
    });
    // Call a function to save user data to the backend here
  }

  void handleSavePassword() {
    print("1111@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

    setState(() {
      editMode = false;
      passwordEditMode = false;
    });
    // Call a function to save password changes to the backend here
  }

  void handleCancel() {
    setState(() {
      userData = {
        'first_name': '',
        'last_name': '',
        'gender': '',
        'date_of_birth': '',
        'age': '',
        'phone_number': '',
        'country': '',
        'city': '',
        'address': '',
      };
      passwordData = {
        'oldPassword': null,
        'password': null,
        'confirm_password': null,
        'email': '',
      };
      editMode = false;
      passwordEditMode = false;
    });
  }

  void handleLogout() {
    // Add your logout logic here
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileBloc, UserProfileState>(
      bloc: BlocProvider.of(context),
      listener: (context, state) {
        // TODO: implement listener
        if (state is ProfileLoadedState) {
          userData = state.user;
        }
        if (state is ProfileLoadingErorrState) {
          final message = state.error;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("$message"),
            ),
          );
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('ProfileScreen'),
            backgroundColor: Color(0xFF192655),
          ),
          body: SingleChildScrollView(
              child: state is ProfileLoadingState
                  ? Center(child: CircularProgressIndicator())
                  : state is ProfileLoadedState
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Login and Security',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color(0xFF16C2D5),
                                        ),
                                      ),
                                      passwordEditMode
                                          ? Row(
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    handleSavePassword();
                                                  },
                                                  child: Text('Save'),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                ElevatedButton(
                                                  onPressed: handleCancel,
                                                  child: Text('Cancel'),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : IconButton(
                                              icon: Icon(Icons.account_circle),
                                              onPressed: () =>
                                                  handlePasswordEdit(),
                                            ),
                                    ],
                                  ),
                                  if (passwordEditMode)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Email'),
                                          onChanged: (value) {
                                            setState(() {
                                              passwordData['email'] = value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Old Password'),
                                          onChanged: (value) {
                                            setState(() {
                                              passwordData['oldPassword'] =
                                                  value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'New Password'),
                                          onChanged: (value) {
                                            setState(() {
                                              passwordData['password'] = value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText:
                                                  'Confirm New Password'),
                                          onChanged: (value) {
                                            setState(() {
                                              passwordData['confirm_password'] =
                                                  value;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  else
                                    Column(
                                      children: [
                                        SizedBox(height: 16),
                                        Text('Email: ${state.user['email']}'),
                                        SizedBox(height: 16),
                                        Text('Password: ********'),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Personal Information',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Color(0xFF16C2D5),
                                        ),
                                      ),
                                      editMode
                                          ? Row(
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    BlocProvider.of<
                                                                UserProfileBloc>(
                                                            context)
                                                        .add(EditProfileEvent(
                                                            userData));
                                                    handleSave();
                                                  },
                                                  child: Text('Save'),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                ElevatedButton(
                                                  onPressed: handleCancel,
                                                  child: Text('Cancel'),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : ElevatedButton(
                                              onPressed: handleEdit,
                                              child: Text('Edit'),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.blue,
                                              ),
                                            ),
                                    ],
                                  ),
                                  if (editMode)
                                    Column(
                                      children: [
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              hintText: userData['first_name'],
                                              labelText: 'First Name'),
                                          onChanged: (value) {
                                            setState(() {
                                              userData['first_name'] = value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Last Name',
                                              hintText: userData['last_name']),
                                          onChanged: (value) {
                                            setState(() {
                                              userData['last_name'] = value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Gender',
                                              hintText: userData['gender']),
                                          onChanged: (value) {
                                            setState(() {
                                              userData['gender'] = value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Date Of Birth',
                                              hintText:
                                                  userData['date_of_birth']),
                                          onChanged: (value) {
                                            setState(() {
                                              userData['date_of_birth'] = value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Age',
                                              hintText: userData['age']),
                                          onChanged: (value) {
                                            setState(() {
                                              userData['age'] = value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Phone Number',
                                              hintText:
                                                  userData['phone_number']),
                                          onChanged: (value) {
                                            setState(() {
                                              userData['phone_number'] = value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Country',
                                              hintText: userData['country']),
                                          onChanged: (value) {
                                            setState(() {
                                              userData['country'] = value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'City',
                                              hintText: userData['city']),
                                          onChanged: (value) {
                                            setState(() {
                                              userData['city'] = value;
                                            });
                                          },
                                        ),
                                        SizedBox(height: 16),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Address',
                                              hintText: userData['address']),
                                          onChanged: (value) {
                                            setState(() {
                                              userData['address'] = value;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  else
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 16),
                                          Text(
                                              'First Name: ${state.user['first_name']}',
                                              style: CustomTextStyles
                                                  .titleMediumPoppinsBlack900),
                                          SizedBox(height: 16),
                                          Text(
                                              'Last Name: ${state.user['last_name']}',
                                              style: CustomTextStyles
                                                  .titleMediumPoppinsBlack900),
                                          SizedBox(height: 16),
                                          Text(
                                              'Gender: ${state.user['gender']}',
                                              style: CustomTextStyles
                                                  .titleMediumPoppinsBlack900),
                                          SizedBox(height: 16),
                                          Text(
                                              'Date Of Birth: ${state.user['date_of_birth']}',
                                              style: CustomTextStyles
                                                  .titleMediumPoppinsBlack900),
                                          SizedBox(height: 16),
                                          Text('Age: ${state.user['age']}',
                                              style: CustomTextStyles
                                                  .titleMediumPoppinsBlack900),
                                          SizedBox(height: 16),
                                          Text(
                                              'Phone Number: ${state.user['phone_number']}',
                                              style: CustomTextStyles
                                                  .titleMediumPoppinsBlack900),
                                          SizedBox(height: 16),
                                          Text(
                                              'Country: ${state.user['country']}',
                                              style: CustomTextStyles
                                                  .titleMediumPoppinsBlack900),
                                          SizedBox(height: 16),
                                          Text('City: ${state.user['city']}',
                                              style: CustomTextStyles
                                                  .titleMediumPoppinsBlack900),
                                          SizedBox(height: 16),
                                          Text(
                                              'Address: ${state.user['address']}',
                                              style: CustomTextStyles
                                                  .titleMediumPoppinsBlack900),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container()),
        );
      },
    );
  }
}
