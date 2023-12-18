part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileEvent {}

class LoadProfileEvent extends  UserProfileEvent {}

// class UpdateProfileEvent extends UserProfileEvent {
//  Map<String, dynamic> newProfileData;

//   UpdateProfileEvent(this.newProfileData);
// }

class EditProfileEvent extends UserProfileEvent {
  Map<String, dynamic> editedData;

  EditProfileEvent(this.editedData);
}
