import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/cubit/seat_cubit.dart';
import 'package:movie_app/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryColor, //change your color here
        ),
        backgroundColor: kTransparentColor,
        elevation: 0,
        title: Text(
          "Select Seats",
          style: primaryColorTextStyle.copyWith(fontSize: 23),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset("assets/movie_screen.png"),
            ),
            SizedBox(height: 30),
            SeatSection()
          ],
        ),
      ),
    );
  }
}

class SeatSection extends StatefulWidget {
  const SeatSection({
    Key? key,
  }) : super(key: key);

  @override
  _SeatSectionState createState() => _SeatSectionState();
}

class _SeatSectionState extends State<SeatSection> {
  @override
  Widget build(BuildContext context) {
    bool randomBool() {
      return Random().nextBool();
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                seatSectionLetter("A"),
                seatSectionLetter("B"),
                seatSectionLetter(""),
                seatSectionLetter("C"),
                seatSectionLetter("D"),
              ],
            ),
            SizedBox(height: 16),
            // Seat 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(isAvailable: randomBool(), id: "A1"),
                SeatItem(isAvailable: randomBool(), id: "B1"),
                seatSectionLetter("1"),
                SeatItem(isAvailable: randomBool(), id: "C1"),
                SeatItem(isAvailable: randomBool(), id: "D1"),
              ],
            ),
            SizedBox(height: 16),
            // Seat 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(isAvailable: randomBool(), id: "A2"),
                SeatItem(isAvailable: randomBool(), id: "B2"),
                seatSectionLetter("2"),
                SeatItem(isAvailable: randomBool(), id: "C2"),
                SeatItem(isAvailable: randomBool(), id: "D2"),
              ],
            ),
            SizedBox(height: 16),
            // Seat 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(isAvailable: randomBool(), id: "A3"),
                SeatItem(isAvailable: randomBool(), id: "B3"),
                seatSectionLetter("3"),
                SeatItem(isAvailable: randomBool(), id: "C3"),
                SeatItem(isAvailable: randomBool(), id: "D3"),
              ],
            ),
            SizedBox(height: 16),
            // Seat 4
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(isAvailable: randomBool(), id: "A4"),
                SeatItem(isAvailable: randomBool(), id: "B4"),
                seatSectionLetter("4"),
                SeatItem(isAvailable: randomBool(), id: "C4"),
                SeatItem(isAvailable: randomBool(), id: "D4"),
              ],
            ),
            SizedBox(height: 16),
            // Seat 5
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeatItem(isAvailable: randomBool(), id: "A5"),
                SeatItem(isAvailable: randomBool(), id: "B5"),
                seatSectionLetter("5"),
                SeatItem(isAvailable: randomBool(), id: "C5"),
                SeatItem(isAvailable: randomBool(), id: "D5"),
              ],
            ),
            SizedBox(height: 30),
            SeatSummary(),
          ],
        ),
      ),
    );
  }

  Widget seatSectionLetter(String name) {
    return Container(
      width: 48,
      child: Center(
        child: Text(
          name,
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
      ),
    );
  }
}

class SeatItem extends StatelessWidget {
  const SeatItem({Key? key, this.isAvailable = true, required this.id})
      : super(key: key);

  final bool isAvailable;
  final String id;

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (isSelected) {
        return kPrimaryColor;
      } else if (isAvailable) {
        return kAvailableColor;
      } else {
        return kUnavailableColor;
      }
    }

    borderColor() {
      if (isAvailable) {
        return kPrimaryColor;
      } else {
        return kUnavailableColor;
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            color: backgroundColor(),
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            border: Border.all(color: borderColor())),
        child: Center(
          child: Text(
            isSelected ? "YOU" : "",
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    );
  }
}

class SeatSummary extends StatefulWidget {
  const SeatSummary({Key? key}) : super(key: key);

  @override
  _SeatSummaryState createState() => _SeatSummaryState();
}

class _SeatSummaryState extends State<SeatSummary> {
  DateTime selectedDate = DateTime.now();
  var selectedTime = "0";
  var date;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    var price = 45000;
    date = "${selectedDate.toLocal()}".split(' ')[0];

    return BlocBuilder<SeatCubit, List<String>>(
      builder: (context, state) {
        return Column(
          children: [
            dateAndTime(context),
            seat(state),
            SizedBox(height: 16),
            total(state, price),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Buy Ticket",
                  style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget dateAndTime(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Date : $date",
                  style:
                      blackTextStyle.copyWith(fontWeight: bold, fontSize: 16),
                ),
              ),
              Icon(Icons.calendar_today)
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            timeItem(widthScreen, "13:30"),
            SizedBox(width: 10),
            timeItem(widthScreen, "16:00"),
            SizedBox(width: 10),
            timeItem(widthScreen, "18:45"),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget timeItem(double widthScreen, String time) {
    bool isSelected = selectedTime == time;

    return GestureDetector(
      onTap: () {
        selectedTime = time;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : kGreyColor,
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        width: (widthScreen / 3) - 30,
        height: 50,
        child: Center(
            child: Text(
          time,
          style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 16),
        )),
      ),
    );
  }

  Widget total(List<String> state, int price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total",
          style: greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: light,
          ),
        ),
        Text(
          NumberFormat.currency(locale: "id", symbol: "IDR ", decimalDigits: 0)
              .format(state.length * price),
          style: primaryColorTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        )
      ],
    );
  }

  Row seat(List<String> state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Your seat",
          style: greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: light,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Text(
            state.join(", "),
            textAlign: TextAlign.end,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        )
      ],
    );
  }
}
