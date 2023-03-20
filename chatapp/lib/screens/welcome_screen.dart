import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatapp/components/roundedbutton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static String id = 'welcome_screen';

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      debugPrint("completed");
      setState(() {});
    });

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate)
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation =
        ColorTween(begin: Colors.white, end: Colors.pink).animate(controller);
    controller.forward();
    // controller.reverse(from: 1.0);
    animation.addListener(
      () {
        setState(() {});
        // debugPrint(animation.value);
      },
    );
    controller.addListener(
      () {
        setState(() {});
        debugPrint(controller.value.toString());
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: controller.value * 100,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              Colors.lightBlueAccent,
              'Log in',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  LoginScreen.id,
                );
              },
            ),
            RoundedButton(
              Colors.blueAccent,
              'Register',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RegistrationScreen.id,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
