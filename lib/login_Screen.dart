import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Button_card.dart';

String email = '';
String pass = '';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9B8AE),
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
                add: 'LOGIN',
                onPressing: () async{
                  showDialog(context: context, builder: (context){
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  });
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: pass,
                    );
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, 'Chat_Screen');
                    // Handle successful sign-in
                  } catch (e) {
                    // Handle sign-in errors
                    print('Sign-in error: $e');
                  }
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
