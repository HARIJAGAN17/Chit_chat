import 'package:flutter/material.dart';
import 'Button_card.dart';
import 'package:avatar_glow/avatar_glow.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController Controller;
  late Animation animation;
  final chat = AssetImage('assets/login_chat.jpg');
  final page = AssetImage('assets/logi_page.jpg');


// Later, use myImage to display the preloaded image.

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = CurvedAnimation(
      parent: Controller,
      curve: Curves.bounceIn,
    );
    Controller.forward();
    Controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: page,
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'avatar',
                child: AvatarGlow(
                  glowColor: Colors.blue,
                  endRadius: 150.0,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 50),
                  child: Material(     // Replace this child with your own
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 100.0,
                      backgroundColor: Colors.grey[100],
                      child: CircleAvatar(
                        radius: 90.0,
                        backgroundImage: AssetImage('assets/login_chat.jpg'),
                      ),
                    ),
                    ),
                  ),
                ),
              ReusableCard(
                onPressing: () {
                  Navigator.pushNamed(context, 'Login_Screen');
                },
                add: 'login',
              ),
              SizedBox(
                height: 10.0,
              ),
              ReusableCard(
                onPressing: () {
                  Navigator.pushNamed(context, 'Registration_Screen');
                },
                add: 'Register',
              )
            ],
          ),
        ),
      ),
    );
  }
}
