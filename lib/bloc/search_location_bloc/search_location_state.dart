import '../../data/models/search_location_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchLocationState {}

class UnitializedSearchState extends SearchLocationState {}

class InitialSearchState extends SearchLocationState {
  final List<SearchLocationModel> searchHistory;

  InitialSearchState({@required this.searchHistory});
}

class ShowingLocationSearchState extends SearchLocationState {
  final SearchLocationModel searchLocation;

  ShowingLocationSearchState({@required this.searchLocation});
}

class FinishSearchState extends SearchLocationState {}

class InactiveSearchState extends SearchLocationState {
  final SearchLocationModel selectedSearchLocation;

  InactiveSearchState({@required this.selectedSearchLocation});
}

class ErrorSearchState extends SearchLocationState {
  final Exception exception;

  ErrorSearchState({this.exception});
}