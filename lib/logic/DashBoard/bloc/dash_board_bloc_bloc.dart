import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_sprs/data/repository/dashBoardRepository.dart';

import 'package:meta/meta.dart';

part 'dash_board_bloc_event.dart';
part 'dash_board_bloc_state.dart';

class DashBoardBloc extends Bloc<DashBoardBlocEvent, DashBoardBlocState> {
  DashBoardBloc() : super(DashBoardBlocInitial()) {
    on<userLoggedIn>(fetchUserData);
    on<userTakeAssesment>(fetchUserData2);
  }

  FutureOr<void> fetchUserData(
      userLoggedIn event, Emitter<DashBoardBlocState> emit) async {
    emit(DashBoardDataLoadingState());

    try {
      final DashBoardRepository repository1 = DashBoardRepository();
      List<Map<String, dynamic>>? data = await repository1.fetchData();

      Future.delayed(
        const Duration(seconds: 2),
      );
      emit(DashBoardDataLoadedState(data));
    } catch (e) {
      emit(DashBoardDataErrorState("erros $e"));
    }
  }

  FutureOr<void> fetchUserData2(
      userTakeAssesment event, Emitter<DashBoardBlocState> emit) async {
    try {
      final DashBoardRepository repository1 = DashBoardRepository();
      List<Map<String, dynamic>>? data = await repository1.fetchData();

      Future.delayed(
        const Duration(seconds: 2),
      );
      emit(DashBoardDataLoadedState(data));
      // print("I have called:$data");
    } catch (e) {
      emit(DashBoardDataErrorState("erros $e"));
    }
  }
}
