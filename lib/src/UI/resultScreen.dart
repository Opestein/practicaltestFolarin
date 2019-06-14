import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakanowpracticaltest/src/Model/searchFlightModel.dart';
import 'package:wakanowpracticaltest/src/Provider/SearchProvider.dart';
import 'package:wakanowpracticaltest/src/Utils/Assets.dart';
import 'package:wakanowpracticaltest/src/Utils/const.dart';

class ResultScreen extends StatefulWidget {
  @override
  State createState() => ResultScreenState();
}

class ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    blocRunner();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    offset = Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
        .animate(controller);

    super.initState();
  }

  @override
  void dispose() {
    blocDisposer();

    super.dispose();
  }

  void blocRunner() {}

  void blocDisposer() {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.blue,
      systemNavigationBarColor: Colors.blue,
      systemNavigationBarDividerColor:
          Colors.blue, //or set color with: Color(0xFF0000FF)
    ));

    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    final searchFlightBloc = SearchProvider.of(context);

    final appBar = AppBar(
      automaticallyImplyLeading: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Results"),
//                Text(
//                  "Jun, 27",
//                  style: TextStyle(fontSize: 12),
//                ),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: safeAreaWidth(context, 3)),
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        )
      ],
      backgroundColor: Colors.blue,
    );

    return Scaffold(
      appBar: appBar,
      body: StreamBuilder(
          stream: searchFlightBloc.subject.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              SearchFlightModel data =
                  SearchFlightModel.fromJson(snapshot.data);
              return ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: safeAreaHeight(context, 6),
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                bottom: BorderSide(color: Colors.black26))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: safeAreaWidth(context, 4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                data.searchFlightModelData.length.toString() +
                                    " Results",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "SORT & FILTER",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: data.searchFlightModelData.length,
                          itemBuilder: (context, index) {
                            controller.forward();

                            String carrierCode = data.searchFlightModelData
                                .elementAt(index)
                                .searchFlightModelDataOfferItems
                                .elementAt(0)
                                .searchFlightModelDataServices
                                .elementAt(0)
                                .searchFlightModelDataSegments
                                .elementAt(0)
                                .searchFlightModelDataFlightSegment
                                .carrierCode;

                            final response = snapshot.data;

//

                            var carrierName = response['dictionaries']
                                ['carriers'][carrierCode];

                            return SlideTransition(
                                position: offset,
                                child: Card(
                                    elevation: 1,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Container(
                                        width: double.infinity,
//                            height: safeAreaHeight(context, 20),
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
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: safeAreaWidth(
                                                          context, 1),
                                                      right: safeAreaWidth(
                                                          context, 4),
                                                      top: safeAreaHeight(
                                                          context, 0),
                                                      bottom: safeAreaHeight(
                                                          context, 0)),
                                                  child: Image.asset(
                                                    Assets.loading,
                                                    width: safeAreaWidth(
                                                        context, 6.5),
                                                    height: safeAreaWidth(
                                                        context, 6.5),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: safeAreaWidth(
                                                          context, 0),
                                                      right: safeAreaWidth(
                                                          context, 4),
                                                      top: safeAreaHeight(
                                                          context, 0),
                                                      bottom: safeAreaHeight(
                                                          context, 0)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        data.searchFlightModelData
                                                            .elementAt(index)
                                                            .searchFlightModelDataOfferItems
                                                            .elementAt(0)
                                                            .searchFlightModelDataServices
                                                            .elementAt(0)
                                                            .searchFlightModelDataSegments
                                                            .elementAt(0)
                                                            .searchFlightModelDataFlightSegment
                                                            .searchFlightModelDataFlightSegmentDeparture
                                                            .at,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors.blue),
                                                        softWrap: true,
                                                      ),
                                                      Text(
                                                        data.searchFlightModelData
                                                            .elementAt(index)
                                                            .searchFlightModelDataOfferItems
                                                            .elementAt(0)
                                                            .searchFlightModelDataServices
                                                            .elementAt(0)
                                                            .searchFlightModelDataSegments
                                                            .elementAt(0)
                                                            .searchFlightModelDataFlightSegment
                                                            .searchFlightModelDataFlightSegmentDeparture
                                                            .iataCode,
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                        ),
                                                        softWrap: true,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: safeAreaWidth(
                                                          context, 0),
                                                      right: safeAreaWidth(
                                                          context, 1),
                                                      top: safeAreaHeight(
                                                          context, 0),
                                                      bottom: safeAreaHeight(
                                                          context, 0)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        data.searchFlightModelData
                                                            .elementAt(index)
                                                            .searchFlightModelDataOfferItems
                                                            .elementAt(0)
                                                            .searchFlightModelDataServices
                                                            .elementAt(0)
                                                            .searchFlightModelDataSegments
                                                            .elementAt(0)
                                                            .searchFlightModelDataFlightSegment
                                                            .searchFlightModelDataFlightSegmentArrival
                                                            .at,
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors.blue),
                                                        softWrap: true,
                                                      ),
                                                      Text(
                                                        data.searchFlightModelData
                                                            .elementAt(index)
                                                            .searchFlightModelDataOfferItems
                                                            .elementAt(0)
                                                            .searchFlightModelDataServices
                                                            .elementAt(0)
                                                            .searchFlightModelDataSegments
                                                            .elementAt(0)
                                                            .searchFlightModelDataFlightSegment
                                                            .searchFlightModelDataFlightSegmentArrival
                                                            .iataCode,
                                                        style: TextStyle(
                                                          color: themeColor,
                                                          fontSize: 10,
                                                        ),
                                                        softWrap: true,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.black38,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: safeAreaWidth(
                                                          context, 1),
                                                      right: safeAreaWidth(
                                                          context, 4),
                                                      top: safeAreaHeight(
                                                          context, 0),
                                                      bottom: safeAreaHeight(
                                                          context, 0)),
                                                  child: Image.asset(
                                                    Assets.pss,
                                                    width: safeAreaWidth(
                                                        context, 6.5),
                                                    height: safeAreaWidth(
                                                        context, 6.5),
                                                  ),
                                                ),
                                                Text(
                                                  "Refundable",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: safeAreaWidth(
                                                          context, 0),
                                                      right: safeAreaWidth(
                                                          context, 1),
                                                      top: safeAreaHeight(
                                                          context, 0),
                                                      bottom: safeAreaHeight(
                                                          context, 0)),
                                                  child: Text(
                                                    nairaString +
                                                        " " +
                                                        (int.parse(data
                                                                    .searchFlightModelData
                                                                    .elementAt(
                                                                        index)
                                                                    .searchFlightModelDataOfferItems
                                                                    .elementAt(
                                                                        0)
                                                                    .searchFlightModelDataPricePerAdult
                                                                    .total) +
                                                                int.parse(data
                                                                    .searchFlightModelData
                                                                    .elementAt(
                                                                        index)
                                                                    .searchFlightModelDataOfferItems
                                                                    .elementAt(
                                                                        0)
                                                                    .searchFlightModelDataPricePerAdult
                                                                    .totalTaxes))
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: themeColor),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height:
                                                  safeAreaHeight(context, 1),
                                            ),
                                            Text(
                                              carrierName,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ))));
                          })
                    ],
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: Colors.white.withOpacity(0.1),
                child: Center(
                  child:
//                    Container(
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(10),
//                        color: Colors.white,
//                      ),
////                        color: Colors.white.withOpacity(0.8),
//
//                      height: responsiveHeight(context, 12),
//                      width: responsiveWidth(context, 35),
//                      child: CupertinoActivityIndicator(
//                          animating: true,
//                          radius: responsiveWidth(context, 4)),
//                    )
                      CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(primaryColor)),
                ),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
