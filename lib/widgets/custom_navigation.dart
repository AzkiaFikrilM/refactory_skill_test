import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skill_test/cubit/cubit.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int index;

  const CustomBottomNavigationItem({
    Key? key,
    required this.imageUrl,
    required this.index,
    this.name = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kPrimaryColor
                : kGreyColor,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kTansparentColor,
            ),
          ),
        ],
      ),
    );
  }
}
