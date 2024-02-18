import 'package:flutter/material.dart';
import 'package:gemini_ai_chat/pages/home_page.dart';
import 'package:gemini_ai_chat/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        LoginPage.routeName: (context) => LoginPage(),
      },
    );
  }
}
