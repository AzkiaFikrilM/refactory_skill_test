import 'package:flutter/material.dart';
import 'package:skill_test/cubit/cubit.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateBottomNavigationItem extends StatelessWidget {
  final int index;
  final String imageUrl;

  const CreateBottomNavigationItem(
      {Key? key, required this.index, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
        ),
        child: Image.asset(
          imageUrl,
          width: 29,
          height: 29,
        ),
      ),
    );
  }
}
