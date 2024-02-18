part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class ChatGenerateNewMessageEvent extends ChatEvent {
  final String inputMsg;
  ChatGenerateNewMessageEvent({
    required this.inputMsg,
  });
}
