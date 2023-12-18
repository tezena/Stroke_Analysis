import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:final_sprs/data/repository/registerRepository.dart';
import 'package:final_sprs/data/models/userDataModel.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<PostUserDataEvent>(postRegistrationData);
  }

  FutureOr<void> postRegistrationData(
      PostUserDataEvent event, Emitter<RegistrationState> emit) async {
    final repository = RegisterRepository();
    emit(RegistrationLoadingState());
    try {
       await repository.postData(event.userData);
      emit(RegistrationSuccessState());
    } catch (e) {
      emit(RegistrationErrorState(error: "$e"));
    }
  }
}
