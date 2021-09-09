import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/cubit/ticket_cubit.dart';
import 'package:movie_app/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/shared/url_helper.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  void initState() {
    context.read<TicketCubit>().getMyTickets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ticketHeader(),
        ticketList(),
      ],
    );
  }

  Widget ticketList() {
    return BlocBuilder<TicketCubit, TicketState>(
      builder: (context, state) {
        if (state is GetTicketFailed) {
          return Center(
            child: Text("Failed to load tickets"),
          );
        } else if (state is GetTicketSuccess) {
          var tickets = state.tickets;
          final database = context.read<TicketCubit>().database;

          if (state.tickets.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Text(
                  "You haven't buy any ticket",
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(fontSize: 25),
                ),
              ),
            );
          }

          return Expanded(
            child: ListView.separated(
              itemCount: tickets.length,
              separatorBuilder: (context, index) {
                return Divider();
              },
              padding: EdgeInsets.only(bottom: 85, top: 20),
              itemBuilder: (context, index) {
                String date = tickets[index].date;
                DateTime parseDate = DateFormat("yyyy-MM-dd").parse(date);
                DateTime selectedDate = parseDate;

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

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: kRedColor,
                        icon: Icons.delete,
                        onTap: () {
                          database.deleteMyTicket(tickets[index]);
                          context.read<TicketCubit>().getMyTickets();
                        },
                      ),
                      IconSlideAction(
                        caption: 'Edit Date',
                        color: kBlackColor,
                        icon: Icons.edit,
                        onTap: () {
                          _selectDate(context).then((value) {
                            date = "${selectedDate.toLocal()}".split(' ')[0];

                            database.updateMyTicket(
                                tickets[index].copyWith(date: date));
                            context.read<TicketCubit>().getMyTickets();
                          });
                        },
                      )
                    ],
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: FadeInImage.assetNetwork(
                            width: 110,
                            placeholder: 'assets/loading.gif',
                            image:
                                "$posterImageUrlMedium${state.tickets[index].poster}",
                            height: 165,
                            imageErrorBuilder: (context, url, error) =>
                                Image.asset(
                              'assets/no_image.png',
                              height: 165,
                              width: 110,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.tickets[index].title,
                                style: blackTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 7),
                              Text(
                                  "${state.tickets[index].date}, ${state.tickets[index].time}"),
                              SizedBox(height: 5),
                              Text(
                                "Seats : ${state.tickets[index].seats}",
                                style: blackTextStyle,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Total : ${state.tickets[index].total}",
                                style: blackTextStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Center ticketHeader() {
    return Center(
      child: Text(
        "Ticket List",
        style: primaryColorTextStyle.copyWith(fontSize: 25, fontWeight: bold),
      ),
    );
  }
}
