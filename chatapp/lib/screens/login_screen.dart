import 'package:chatapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/roundedbutton.dart';
import 'package:chatapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _auth = FirebaseAuth.instance;
  late bool _isLoading = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset("images/logo.png"),
                ),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFeildDecortion.copyWith(hintText: 'Enter your email')),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration:
                  kTextFeildDecortion.copyWith(hintText: 'Enter your password'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              Colors.lightBlueAccent,
              'Log in',
              onPressed: () async {
                setState(
                  () {
                    _isLoading = true;
                  },
                );
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email, password: password)
                    .then(
                  (value) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  },
                ).catchError(
                  (onError) {
                    setState(
                      () {
                        _isLoading = false;
                      },
                    );
                    debugPrint(onError);
                  },
                );
                setState(
                  () {
                    _isLoading = false;
                  },
                );
              },
            ),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
