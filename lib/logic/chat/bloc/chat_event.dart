part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class AddChatMessage extends ChatEvent {
  final String message;
  final bool isUserMessage;

  AddChatMessage(this.message, this.isUserMessage);
}

class ChatPageOpen extends ChatEvent {}
