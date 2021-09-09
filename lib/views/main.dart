import 'package:flutter/material.dart';
import 'package:movie_app/cubit/page_cubit.dart';
import 'package:movie_app/shared/theme.dart';
import 'package:movie_app/views/favorite.dart';
import 'package:movie_app/views/home.dart';
import 'package:movie_app/views/ticket.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TicketPage();
        case 2:
          return FavoritePage();
        default:
          return HomePage();
      }
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Container(
          color: kBackgroundColor,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: kBackgroundColor,
              body: Stack(
                children: [
                  buildContent(currentIndex),
                  CustomBottomNavigation(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        margin: EdgeInsets.fromLTRB(24, 0, 24, 20),
        width: double.infinity,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomBottomNavigationItem(
              image: "assets/home.png",
              index: 0,
            ),
            CustomBottomNavigationItem(
              image: "assets/ticket.png",
              index: 1,
            ),
            CustomBottomNavigationItem(
              image: "assets/book.png",
              index: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationItem extends StatelessWidget {
  const CustomBottomNavigationItem(
      {Key? key, required this.image, required this.index})
      : super(key: key);

  final String image;
  final int index;

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
            image,
            color: context.read<PageCubit>().state == index
                ? kPrimaryColor
                : kGreyColor,
            height: 24,
            width: 24,
          ),
          Container(
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kTransparentColor,
              borderRadius: BorderRadius.circular(defaultBorderRadius),
            ),
            width: 30,
            height: 2,
          )
        ],
      ),
    );
  }
}
