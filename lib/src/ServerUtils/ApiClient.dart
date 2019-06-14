import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:query_params/query_params.dart';
import 'package:wakanowpracticaltest/src/LocalUtils/model.dart';
import 'package:wakanowpracticaltest/src/Model/requestTokenModel.dart';
import 'package:wakanowpracticaltest/src/Model/searchFlightModel.dart';
import 'package:wakanowpracticaltest/src/Repositories/repo.dart';
import 'package:wakanowpracticaltest/src/ServerUtils/BaseUrl.dart';
import 'package:wakanowpracticaltest/src/UI/resultScreen.dart';
import 'package:wakanowpracticaltest/src/Utils/uiFunctions.dart';

class ApiClient {
  DatabaseRepo databaseRepo = DatabaseRepo();

  Future<SearchFlightModel> searchFlightAPI(
      context,
      String origin,
      String destination,
      String departureDate,
      String adults,
      String travelClass,
      String nonStop,
      String currency,
      String max) async {
    final url = baseUrl + 'security/oauth2/token';

    Map<String, dynamic> body = {
      'grant_type': "client_credentials",
      'client_id': "9EUyDJvzfPDs57kucVPODMtsYALPtmMN",
      'client_secret': "noPX4LEv2j2c5pPd",
    };

    final response = await http.post(
      url,
      body: body,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
    ).catchError((err) {
      modalBottomSheet(context, "error connecting to internet", false);
    });
    print(response.toString());

    print("qqq");

    if (response != null && response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      print(response.body.toString());
      print("qqq");
      print(responseJson);

      var data = RequestTokenModel.fromJson(responseJson);

      UserDetails userDetails = UserDetails(id: 0, token: data.access_token);

      databaseRepo.saveUserDetails(userDetails);

      URLQueryParams queryParams = URLQueryParams();
      queryParams.append('origin', origin);
      queryParams.append('destination', destination);
      queryParams.append('departureDate', departureDate);
      queryParams.append('adults', adults);
      queryParams.append('travelClass', travelClass);
      queryParams.append('nonStop', nonStop);
      queryParams.append('currency', currency);
      queryParams.append('max', max);

      List<UserDetails> list = await databaseRepo.getUserDetails();

      String token = list.elementAt(0).token;

      final urlSearch =
          baseUrl + "shopping/flight-offers?" + queryParams.toString();

      final responseSearch = await http.get(
        urlSearch,
        headers: {
          "Authorization": "Bearer " + token,
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
      ).catchError((err) {
        modalBottomSheet(context, "error connecting to internet", false);
      });
      print(responseSearch.toString());

      print(responseSearch.body.toString());

      print(responseSearch.statusCode.toString());

      if (responseSearch.statusCode == 200) {
        final responseSearchJson = json.decode(responseSearch.body);

        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => ResultScreen()));

        return SearchFlightModel.fromJson(responseSearchJson);
      }
    } else {
      modalBottomSheet(context, "An error occured", false);
    }

    return null;
  }
}
