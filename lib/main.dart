import 'package:flutter/material.dart';
import 'package:wakanowpracticaltest/src/Bloc/bloc.dart';
import 'package:wakanowpracticaltest/src/Provider/SearchProvider.dart';
import 'package:wakanowpracticaltest/src/Repositories/repo.dart';
import 'package:wakanowpracticaltest/src/UI/SplashScreen.dart';

void main() {
  runApp(SearchProvider(
    searchFlightBloc: SearchFlightBloc(SearchRepo()),
    child: MaterialApp(
      title: 'WakaNow Test App',
      home: Splash(),
      theme: ThemeData(
          fontFamily: "CircularStd",
          primaryColor: Colors.orange.shade800,
          textTheme: TextTheme().copyWith(
              subhead: TextStyle(
            fontFamily: "CircularStd",
          ))),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
