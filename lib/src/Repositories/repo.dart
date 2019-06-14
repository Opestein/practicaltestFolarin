import 'package:wakanowpracticaltest/src/LocalUtils/databaseHelper.dart';
import 'package:wakanowpracticaltest/src/LocalUtils/model.dart';
import 'package:wakanowpracticaltest/src/ServerUtils/ApiClient.dart';

class DatabaseRepo {
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<int> saveUserDetails(UserDetails user) {
    print("repo");
    return databaseHelper.saveUser(user);
  }

  Future<List<UserDetails>> getUserDetails() {
    print("repo");
    return databaseHelper.getUserDetails();
  }

  Future<int> deleteUsers() {
    print("repo");
    return databaseHelper.deleteUsers();
  }

  Future<bool> getLoggedInStatus() {
    print("repo");
    return databaseHelper.isLoggedIn();
  }
}

class SearchRepo {
  ApiClient apiClient = ApiClient();

  Future searchFlight(
      context,
      String origin,
      String destination,
      String departureDate,
      String adults,
      String travelClass,
      String nonStop,
      String currency,
      String max) async {
    var responseSearchJson = await apiClient.searchFlightAPI(
        context,
        origin,
        destination,
        departureDate,
        adults,
        travelClass,
        nonStop,
        currency,
        max);
    return responseSearchJson;
  }
}
