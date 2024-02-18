import 'package:flutter/material.dart';
import 'package:gemini_ai_chat/components/text_format.dart';
import 'package:gemini_ai_chat/components/textfield_styling.dart';
import 'package:gemini_ai_chat/pages/home_page.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'LoginPage';
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();

  final username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1b263b),
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    25,
                  ),
                  child: Column(
                    children: [
                      Lottie.asset(
                        'assets/lottie/ai-logo.json',
                        width: 200,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Form(
                        key: _formKey,
                        child: CustomTextField(
                          labelText: 'Username',
                          controller: username,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please enter a valid name";
                            } else if (username.text.length < 4) {
                              return 'Please enter atleast 4 characters';
                            } else if (username.text.length > 11) {
                              return 'Too many characters in your name!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFffffff),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(
                                context,
                                HomePage.routeName,
                                arguments: username.text,
                              );
                              FocusScope.of(context).unfocus();
                            }
                          },
                          child: const PoppinsText(
                            text: 'Start chating',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
