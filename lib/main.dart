import 'package:chit_chat/firebase_options.dart';
import 'package:chit_chat/login_Screen.dart';
import 'package:chit_chat/registration_Screen.dart';
import 'package:chit_chat/welcome_Screen.dart';
import 'package:flutter/material.dart';
import 'chat_Screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Welcome_Screen',
      routes: {
        'Welcome_Screen': (context) => WelcomeScreen(),
        'Login_Screen': (context) => LoginScreen(),
        'Registration_Screen': (context) => RegistrationScreen(),
        'Chat_Screen': (context) => ChatScreen(),
      },
    );
  }
}
