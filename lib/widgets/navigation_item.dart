import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_test/shared/theme.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      padding: EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: ClipOval(
              child: Material(
                color: kGreyColor.withOpacity(0.3),
                child: Image.network(
                  _user.photoURL.toString(),
                  fit: BoxFit.fitHeight,
                  height: 56,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hallo, ' + _user.displayName.toString() + "!",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                '2 Task for Today',
                style: TextStyle(
                  color: kYellowColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
