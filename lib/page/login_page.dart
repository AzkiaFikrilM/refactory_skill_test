import 'package:flutter/material.dart';
import 'package:skill_test/shared/theme.dart';
import 'package:skill_test/utils/authentication.dart';
import 'package:skill_test/widgets/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //NOTE : LOGO APP
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/icon_card.png',
                        height: 160,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 20),
                    //NOTE : NAME APP
                    Text(
                      'TODO List',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //NOTE : DESCRIPTION PAGE NAME
                    Text(
                      'Authentication',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              //START AUTH SYSTEM
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  print(snapshot);
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Text('connection state none');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      kPrimaryColor,
                    ),
                  );
                },
              ),
              //END AUTH SYSTEM
            ],
          ),
        ),
      ),
    );
  }
}
