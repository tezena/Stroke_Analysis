part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}

class PostUserDataEvent extends RegistrationEvent {
  final UserData userData;

  PostUserDataEvent({required this.userData});
}
