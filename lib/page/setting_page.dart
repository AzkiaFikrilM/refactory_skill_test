import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_test/shared/theme.dart';
import 'package:skill_test/utils/authentication.dart';

import 'login_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //NOTE : USER PROFILE
            _user.photoURL != null
                ? ClipOval(
                    child: Material(
                      color: kGreyColor.withOpacity(0.3),
                      child: Image.network(
                        _user.photoURL!,
                        fit: BoxFit.fitHeight,
                        height: 80,
                      ),
                    ),
                  )
                : ClipOval(
                    child: Material(
                      color: kGreyColor.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: kGreyColor,
                        ),
                      ),
                    ),
                  ),
            SizedBox(height: 16.0),
            //NOTE : NAME USER
            Text(
              'Hello, ' + _user.displayName!,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 26,
              ),
            ),
            SizedBox(height: 8.0),
            //NOTE : EMAIL USER
            Text(
              '( ${_user.email!} )',
              style: TextStyle(
                color: kGreyColor,
                fontSize: 20,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 24.0),
            //NOTE : DESCRIPTION PAGE
            Text(
              'You are now signed in using your Google account. To sign out of your account, click the "Sign Out" button below.',
              style: TextStyle(
                  color: kGreyColor.withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.2),
            ),
            SizedBox(height: 16.0),
            //START BUTTON LOGOUT
            _isSigningOut
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kSameRedColor),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        _isSigningOut = true;
                      });
                      await Authentication.signOut(context: context);
                      setState(() {
                        _isSigningOut = false;
                      });
                      Navigator.of(context)
                          .pushReplacement(_routeToSignInScreen());
                    },
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        color: kRedColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
            //END BUTTON LOGOUT
          ],
        ),
      ),
    );
  }
}
