import 'package:flutter/material.dart';
import 'package:social_media_app/screens/login/login_screen.dart';
import 'package:social_media_app/screens/signup/signup_screen.dart';
import 'package:social_media_app/utils/app_color.dart';


class AuthLoginSignUp extends StatefulWidget {
  @override
  _AuthLoginSignUpState createState() => _AuthLoginSignUpState();
}

class _AuthLoginSignUpState extends State<AuthLoginSignUp> {
  bool isSignedUp;

  @override
  void initState() {
    isSignedUp = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kDarkpurple,
          body: SingleChildScrollView(
                      child: Row(
              children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 5,
        color: kDarkpurple,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isSignedUp = true;
                    });
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: isSignedUp ? kwhite : klblack,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isSignedUp = false;
                  });
                },
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: isSignedUp ? klblack : kwhite,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
        ),
      ),
      isSignedUp ? LoginScreen() : SignUpScreen(),
              ],
            ),
          ),
        ),
    );
  }
}

//Icon(Icons.verified_user),
//Icon(Icons.visibility)
