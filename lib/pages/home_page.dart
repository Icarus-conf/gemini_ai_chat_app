import 'package:flutter/material.dart';
import 'package:gemini_ai_chat/bloc/chat_bloc.dart';
import 'package:gemini_ai_chat/components/chat_bubble.dart';
import 'package:gemini_ai_chat/components/text_format.dart';
import 'package:gemini_ai_chat/components/textfield_styling.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_ai_chat/models/msg_model.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  final ChatBloc chatBloc = ChatBloc();

  @override
  Widget build(BuildContext context) {
    var username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF22333b),
        automaticallyImplyLeading: false,
        title: const PoppinsText(
          text: 'Chatting with Ai',
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF16222A),
              Color(0xFF3A6073),
            ],
          ),
        ),
        child: BlocConsumer<ChatBloc, ChatState>(
          bloc: chatBloc,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (ChatSuccessState):
                List<MsgModel> messages = (state as ChatSuccessState).messages;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return ChatBubble(
                          user: messages[index].role == 'user'
                              ? username
                              : 'Gemini',
                          message: messages[index].parts.first.text.trim(),
                          color: messages[index].role == 'user'
                              ? const Color(0xFF00296b).withOpacity(0.5)
                              : Colors.black.withOpacity(0.5),
                        );
                      },
                    )),
                    if (chatBloc.loading)
                      Lottie.asset(
                        'assets/lottie/loading.json',
                        width: 200,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: controller,
                              hintText: 'Ask something...',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (controller.text.isNotEmpty) {
                                chatBloc.add(ChatGenerateNewMessageEvent(
                                    inputMsg: controller.text));
                                controller.clear();
                                FocusScope.of(context).unfocus();
                              }
                            },
                            child: Image.asset(
                              'assets/images/paper.png',
                              width: 35,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
