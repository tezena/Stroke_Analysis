part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

class ChatInitialState extends ChatState {
  final List<Map<String, dynamic>> messages;

  ChatInitialState(this.messages);
}

class ChatStartedState extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatErrorState extends ChatState {
  final String errorMessage;

  ChatErrorState(this.errorMessage);
}

class ChatUpdatedState extends ChatState {
  final List<Map<String, dynamic>> updatedMessages;

  ChatUpdatedState(this.updatedMessages);
}
