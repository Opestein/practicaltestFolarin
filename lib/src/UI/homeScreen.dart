import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakanowpracticaltest/src/Provider/SearchProvider.dart';
import 'package:wakanowpracticaltest/src/Utils/Assets.dart';
import 'package:wakanowpracticaltest/src/Utils/const.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  var serviceNamefocusNode = FocusNode();
  var locationfocusNode = FocusNode();

  bool _serviceNamevalidate = false;
  bool _locationPassword = false;

  String pageName;
  var pageColor;
  var iconColor;

  var homeIcon;
  var homeIconBottom;
  var walletIcon;
  var dashboardIcon;
  var playIcon;
  var playIconBottom;
  var aboutUsIcon;
  var viewResults;

  int _selectedDrawerIndex = 1;

  double height = 0.0;

  AnimationController controller;
  Animation<Offset> offset;

  String origin = "NYC";
  String destination = "MAD";
  String departureDate = "2019-08-01";
  String adults = "1";
  String travelClass = "ECONOMY";
  String passengers = "1 Adult";
  String nonStop = "true";
  String currency = "ngn";
  String max = "50";

  bool isLoading = false;

  @override
  void initState() {
    blocRunner();

    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    offset = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
        .animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    blocDisposer();

    super.dispose();
  }

  void blocRunner() {}

  void blocDisposer() {}

  Future<bool> exitApp() {
    exit(0);
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
//        statusBarColor: themeColor,
//        systemNavigationBarColor: themeColor,
//        systemNavigationBarDividerColor:
//            themeColor //or set color with: Color(0xFF0000FF)
//        ));

    MediaQueryData mediaQuery = MediaQuery.of(context);
    final searchFlightBloc = SearchProvider.of(context);

    final customAppBar = Container(
      width: mediaQuery.size.width * 0.99,
      height: safeAreaHeight(context, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          style: BorderStyle.solid,
          color: white,
        ),
      ),
      child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: mediaQuery.size.width * 0.3,
                color: themeColor,
                child: Center(
                  child: Text(
                    "One Way",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: mediaQuery.size.width * 0.3,
//                color: themeColor,
                child: Center(
                  child: Text(
                    "Return Trip",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: mediaQuery.size.width * 0.3,
//                color: themeColor,
                child: Center(
                  child: Text(
                    "Multi-City",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

    final detailCard = SlideTransition(
        position: offset,
        child: Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: Container(
              width: double.infinity,
              height: safeAreaHeight(context, 54),
              padding: EdgeInsets.only(
                  left: safeAreaWidth(context, 3),
                  right: safeAreaWidth(context, 3),
                  top: safeAreaHeight(context, 1),
                  bottom: safeAreaHeight(context, 1)),
//                                    decoration: BoxDecoration(
//                                        shape: BoxShape.rectangle,
//                                        color: themeColor),

              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
//                    width: double.infinity,
//                    height: safeAreaHeight(context, 16),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: safeAreaWidth(context, 0),
                                      right: safeAreaWidth(context, 4),
                                      top: safeAreaHeight(context, 0),
                                      bottom: safeAreaHeight(context, 0)),
                                  child: Icon(
                                    Icons.my_location,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: safeAreaWidth(context, 0),
                                      right: safeAreaWidth(context, 4),
                                      top: safeAreaHeight(context, 0),
                                      bottom: safeAreaHeight(context, 0)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "FROM",
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      Text(
                                        origin,
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: safeAreaWidth(context, 0),
                                      right: safeAreaWidth(context, 4),
                                      top: safeAreaHeight(context, 0),
                                      bottom: safeAreaHeight(context, 0)),
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: safeAreaWidth(context, 0),
                                      right: safeAreaWidth(context, 4),
                                      top: safeAreaHeight(context, 0),
                                      bottom: safeAreaHeight(context, 0)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "TO",
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      Text(
                                        destination,
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Divider()
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            Assets.toggle_button,
                            width: safeAreaWidth(context, 10),
                            height: safeAreaHeight(context, 6),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: safeAreaWidth(context, 0),
                                      right: safeAreaWidth(context, 4),
                                      top: safeAreaHeight(context, 1),
                                      bottom: safeAreaHeight(context, 1)),
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  "June",
                                ),
                              ],
                            ),
                            SizedBox(
                              height: safeAreaHeight(context, 1.5),
                            ),
                            Text(
                              "27",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: safeAreaHeight(context, 11)),
                            ),
                            SizedBox(
                              height: safeAreaHeight(context, 1.5),
                            ),
                            Text(
                              "Thursday",
                            ),
                          ],
                        ),
                        Container(
                          height: safeAreaHeight(context, 20),
                          color: Colors.black,
                          width: 0.2,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: safeAreaWidth(context, 0),
                                  right: safeAreaWidth(context, 4),
                                  top: safeAreaHeight(context, 1),
                                  bottom: safeAreaHeight(context, 1)),
                              child: Icon(
                                Icons.calendar_today,
                                size: safeAreaWidth(context, 10),
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              "ADD RETURN",
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
//                    width: double.infinity,
//                    height: safeAreaHeight(context, 16),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: safeAreaHeight(context, 2),
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: safeAreaWidth(context, 0),
                                  right: safeAreaWidth(context, 4),
                                  top: safeAreaHeight(context, 0),
                                  bottom: safeAreaHeight(context, 0)),
                              child: Icon(
                                Icons.settings_input_composite,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: safeAreaWidth(context, 0),
                                  right: safeAreaWidth(context, 4),
                                  top: safeAreaHeight(context, 0),
                                  bottom: safeAreaHeight(context, 0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "CABIN",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                  Text(
                                    travelClass,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: safeAreaWidth(context, 0),
                                  right: safeAreaWidth(context, 4),
                                  top: safeAreaHeight(context, 0),
                                  bottom: safeAreaHeight(context, 0)),
                              child: Icon(
                                Icons.person,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: safeAreaWidth(context, 0),
                                  right: safeAreaWidth(context, 4),
                                  top: safeAreaHeight(context, 0),
                                  bottom: safeAreaHeight(context, 0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    passengers,
                                    style: TextStyle(fontSize: 11),
                                  ),
                                  Text(
                                    adults,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));

    final searchButton = Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: primaryColor,
        ),
        width: mediaQuery.size.width * 0.8,
        child: MaterialButton(
          elevation: 0.0,
          onPressed: () {
//            Navigator.push(context,
//                CupertinoPageRoute(builder: (context) => ResultScreen()));

            setState(() {
              isLoading = true;
            });

            searchFlightBloc
                .searchNow(context, origin, destination, departureDate, adults,
                    travelClass, nonStop, currency, max)
                .then((result) {
              setState(() {
                isLoading = false;
              });
            });
          },
          height: 60.0,
          child: Text('Search Flights',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0)),
        ),
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: safeAreaWidth(context, 3)),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(Assets.homebg))),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: safeAreaHeight(context, 5)),
                customAppBar,
                SizedBox(height: safeAreaHeight(context, 2)),
                detailCard,
                SizedBox(height: safeAreaHeight(context, 1)),
                searchButton
              ],
            ),
            Positioned(
              child: isLoading
                  ? Container(
                      color: Colors.grey.withOpacity(0.5),
                      child: Center(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
//                        color: Colors.white.withOpacity(0.8),

                        height: responsiveHeight(context, 12),
                        width: responsiveWidth(context, 35),
                        child: CupertinoActivityIndicator(
                            animating: true,
                            radius: responsiveWidth(context, 4)),
                      )
//                        CircularProgressIndicator(
//                            valueColor:
//                                AlwaysStoppedAnimation<Color>(primaryColor)),
                          ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
