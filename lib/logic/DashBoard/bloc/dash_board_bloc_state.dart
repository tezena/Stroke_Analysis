part of 'dash_board_bloc_bloc.dart';

@immutable
sealed class DashBoardBlocState {}

final class DashBoardBlocInitial extends DashBoardBlocState {}

class DashBoardDataLoadingState extends DashBoardBlocState {}

class DashBoardDataLoadedState extends DashBoardBlocState {
  final  List<Map<String, dynamic>>? data;
  DashBoardDataLoadedState(this.data);
}

class DashBoardDataErrorState extends DashBoardBlocState {
  final String error;
  DashBoardDataErrorState(this.error);
}
