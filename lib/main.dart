import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flashchat_flutter/screens/welcome_screen.dart';
import 'package:flashchat_flutter/screens/login_screen.dart';
import 'package:flashchat_flutter/screens/registration_screen.dart';
import 'package:flashchat_flutter/screens/chat_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return ChatApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Directionality(
          textDirection: TextDirection.ltr,
          child: SpinKitFadingCircle(color: Colors.white),
        );
      },
    );
  }
}

class ChatApp extends StatelessWidget {
  const ChatApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        'register': (context) => RegistrationScreen(),
        'login': (context)=> LoginScreen(),
        'chat': (context)=> ChatScreen()
      },
    );
  }
}
