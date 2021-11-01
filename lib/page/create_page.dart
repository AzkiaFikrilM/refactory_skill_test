import 'package:flutter/material.dart';
import 'package:skill_test/shared/theme.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Container(
          child: Text('Create'),
        ),
      ),
    );
  }
}