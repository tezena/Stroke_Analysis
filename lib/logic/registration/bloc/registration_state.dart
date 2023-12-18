part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}
class RegistrationLoadingState extends RegistrationState {}

class RegistrationSuccessState extends RegistrationState {}

class RegistrationErrorState extends RegistrationState {
  final String error;

  RegistrationErrorState({required this.error});
}
