import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/page_cubit.dart';
import 'package:movie_app/shared/theme.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem({
    Key? key, required this.image, required this.index
  }) : super(key: key);

  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            image,
            color: context.read<PageCubit>().state == index ? kPrimaryColor : kGreyColor,
            height: 24,
            width: 24,
          ),
          Container(
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index ? kPrimaryColor : kTransparentColor,
              borderRadius:
              BorderRadius.circular(defaultBorderRadius),
            ),
            width: 30,
            height: 2,
          )
        ],
      ),
    );
  }
}
