import 'package:flutter/widgets.dart';
import 'package:wakanowpracticaltest/src/Bloc/bloc.dart';
import 'package:wakanowpracticaltest/src/Repositories/repo.dart';

class SearchProvider extends InheritedWidget {
  final SearchFlightBloc searchFlightBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SearchFlightBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(SearchProvider) as SearchProvider)
          .searchFlightBloc;

  SearchProvider({Key key, SearchFlightBloc searchFlightBloc, Widget child})
      : this.searchFlightBloc =
            searchFlightBloc ?? SearchFlightBloc(SearchRepo()),
        super(child: child, key: key);
}
