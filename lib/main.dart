import 'package:flutter/material.dart';
import 'package:movie_app/cubit/page_cubit.dart';
import 'package:movie_app/cubit/movie_cubit.dart';
import 'package:movie_app/service/api_service.dart';
import 'package:movie_app/views/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => MovieCubit(ApiService()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
      ),
    );
  }
}
