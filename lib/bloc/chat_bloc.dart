import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gemini_ai_chat/models/msg_model.dart';
import 'package:gemini_ai_chat/repository/chat_repository.dart';
import 'package:meta/meta.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSuccessState(messages: const [])) {
    on<ChatGenerateNewMessageEvent>(chatGenerateNewMessageEvent);
  }

  List<MsgModel> messages = [];

  bool loading = false;

  FutureOr<void> chatGenerateNewMessageEvent(
      ChatGenerateNewMessageEvent event, Emitter<ChatState> emit) async {
    messages
        .add(MsgModel(role: 'user', parts: [PartModel(text: event.inputMsg)]));
    emit(ChatSuccessState(messages: messages));
    loading = true;
    String generatedMsg = await ChatRepo.chatTextGenerationRep(messages);
    if (generatedMsg.isNotEmpty) {
      messages.add(MsgModel(role: 'model', parts: [
        PartModel(text: generatedMsg),
      ]));
      emit(ChatSuccessState(messages: messages));
    }
    loading = false;
  }
}
