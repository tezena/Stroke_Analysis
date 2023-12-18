import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_sprs/data/repository/profileRpository.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:meta/meta.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial()) {
    on<LoadProfileEvent>(fetchUserProfile);
    on<EditProfileEvent>(editProfile);
  }
  final repository = ProfileRespository();

  FutureOr<void> fetchUserProfile(
      LoadProfileEvent event, Emitter<UserProfileState> emit) async {
    emit(ProfileLoadingState());
    Future.delayed(Duration(seconds: 1));
    try {
      final data;
      data = await repository.fetchUserData();
      Map<String, dynamic> user = data['user'];
      user.forEach((key, value) {
        user[key] = value.toString();
      });

      emit(ProfileLoadedState(user));
    } catch (e) {
      emit(ProfileLoadingErorrState("$e"));
    }
  }

  FutureOr<void> editProfile(
      EditProfileEvent event, Emitter<UserProfileState> emit) async {
    emit(ProfileEditingState());
     print("222");
    try {
      final response = await repository.updateProfile(event.editedData);

      final data;
      data = await repository.fetchUserData();
      Map<String, dynamic> user = data['user'];
      user.forEach((key, value) {
        user[key] = value.toString();
      });
      emit(ProfileLoadedState(user));
    } catch (e) {
      emit(ProfileEditingState());
    }
  }
}
