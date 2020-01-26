import 'package:living_city/data/models/search_location_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchLocationEvent {}

class LoadHistoryRequestEvent extends SearchLocationEvent {}

class CancelSearchRequestEvent extends SearchLocationEvent {}

class SearchRequestEvent extends SearchLocationEvent {
  final SearchLocationModel searchLocation;
  SearchRequestEvent({@required this.searchLocation});
}

class SearchUserLocationRequestEvent extends SearchLocationEvent {}

class AcceptLocationEvent extends SearchLocationEvent {}

class DismissedEvent extends SearchLocationEvent {}
// class ClearRequestSearchHistoryEvent extends SearchHistoryEvent {}