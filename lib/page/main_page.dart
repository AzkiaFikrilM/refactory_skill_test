import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test/cubit/cubit.dart';
import 'package:skill_test/page/setting_page.dart';
import 'package:skill_test/shared/theme.dart';
import 'package:skill_test/widgets/create_navigation.dart';
import 'package:skill_test/widgets/custom_navigation.dart';

import 'create_page.dart';
import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;
  @override
  Widget build(BuildContext context) {
    //NOTE : ROUTING BOTTOM NAVIGATIONT
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage(user: _user);
        case 1:
          return CreatePage();
        case 2:
          return SettingPage(
            user: _user,
          );
        default:
          return HomePage(user: _user);
      }
    }

    //NOTE : BUTTON NAVIGATIONT
    Widget customButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 83,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                imageUrl: 'assets/icon_schedule.png',
                name: 'Task',
              ),
              CreateBottomNavigationItem(
                index: 1,
                imageUrl: 'assets/icon_plus.png',
              ),
              CustomBottomNavigationItem(
                index: 2,
                imageUrl: 'assets/icon_setting.png',
                name: 'Setting',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
