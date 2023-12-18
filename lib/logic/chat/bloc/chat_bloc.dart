import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitialState([])) {
    on<AddChatMessage>(addMessage);
  
  }

  FutureOr<void> addMessage(AddChatMessage event, Emitter<ChatState> emit) {
    emit(ChatStartedState());
    final messages = (state as ChatInitialState).messages;
    final List<Map<String, dynamic>> updatedMessages = List.from(messages)
      ..add({'message': event.message, 'isUserMessage': event.isUserMessage});
    emit(ChatUpdatedState(updatedMessages));
  }
}
