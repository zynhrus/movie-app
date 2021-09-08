import 'package:flutter/material.dart';
import 'package:movie_app/cubit/page_cubit.dart';
import 'package:movie_app/shared/theme.dart';
import 'package:movie_app/views/favorite.dart';
import 'package:movie_app/views/home.dart';
import 'package:movie_app/views/ticket.dart';
import 'package:movie_app/widgets/custom_buttom_navigation_item.dart';
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
