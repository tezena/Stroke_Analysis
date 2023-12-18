part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}

class ProfileLoadingState extends UserProfileState {}

class ProfileLoadedState extends UserProfileState {
  final Map<String, dynamic> user;

  ProfileLoadedState(this.user);
}
class ProfileEditingState extends UserProfileState{}


class ProfileLoadingErorrState extends UserProfileState {
  final String  error;

  ProfileLoadingErorrState(this.error);
}
class ProfileEditingErorrState extends UserProfileState {
  final String error;

  ProfileEditingErorrState(this.error);
}


