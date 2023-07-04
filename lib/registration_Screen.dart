import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Button_card.dart';

String email = '';
String pass = '';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        },
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.of(context).pop();
      // User creation successful, you can handle the result here
    } catch (e) {
      // User creation failed, handle the error
      print('Failed to create user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF642B73),
              Color(0xFFC6426E),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'avatar',
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/login_chat.jpg'),
                  radius: 70.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              EmailTextField(),
              SizedBox(height: 16.0),
              PasswordTextField(),
              SizedBox(height: 16.0),
              ReusableCard(
                add: 'REGISTER',
                onPressing: () {
                  createUserWithEmailAndPassword(email, pass);
                  Navigator.pushNamed(context, 'Chat_Screen');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        pass = value;
      },
      style: TextStyle(
          color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600),
      cursorColor: Colors.white,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Set border color
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white), // Set focused border color
        ),
        labelStyle: TextStyle(color: Colors.white),
        labelText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        email = value;
      },
      style: TextStyle(
          color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600),
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        hintText: 'gmail.com@',
        hintStyle: TextStyle(
            color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Set border color
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white), // Set focused border color
        ),
        labelStyle: TextStyle(color: Colors.white),
        labelText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
