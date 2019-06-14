import 'package:rxdart/rxdart.dart';
import 'package:wakanowpracticaltest/src/Model/searchFlightModel.dart';
import 'package:wakanowpracticaltest/src/Repositories/repo.dart';

class SearchFlightBloc {
  SearchRepo searchRepo = SearchRepo();

  BehaviorSubject<SearchFlightModel> _subject =
      BehaviorSubject<SearchFlightModel>();

  SearchFlightBloc(this.searchRepo) {
//    searchNow();
  }

  searchNow(
      context,
      String origin,
      String destination,
      String departureDate,
      String adults,
      String travelClass,
      String nonStop,
      String currency,
      String max) async {
    _subject.sink.add(await searchRepo.searchFlight(
        context,
        origin,
        destination,
        departureDate,
        adults,
        travelClass,
        nonStop,
        currency,
        max));
  }

  BehaviorSubject<SearchFlightModel> get subject => _subject;

  void dispose() {
    _subject.close();
  }
}
