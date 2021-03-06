import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:living_city/data/models/trip_model.dart';
import 'package:meta/meta.dart';

part 'trip_details_event.dart';
part 'trip_details_state.dart';

class TripDetailsBloc extends Bloc<TripDetailsEvent, TripDetailsState> {
  final TripModel tripModel;

  TripDetailsBloc(this.tripModel) : super(TripDetailsInitial(tripModel));

  @override
  TripDetailsState get initialState => TripDetailsInitial(tripModel);

  @override
  Stream<TripDetailsState> mapEventToState(
    TripDetailsEvent event,
  ) async* {}
}
