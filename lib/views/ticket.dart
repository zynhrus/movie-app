import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Ticket List",
            style:
            primaryColorTextStyle.copyWith(fontSize: 25, fontWeight: bold),
          ),
        ),
      ],
    );
  }
}
