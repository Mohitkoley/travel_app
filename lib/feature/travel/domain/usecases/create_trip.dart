import 'package:travel_app/feature/travel/shared/export/trip_features_export.dart';

class CreateTrip {
  final TripRepository _tripRepository;

  CreateTrip(this._tripRepository);

  Future call(Trip trip) async {
    return await _tripRepository.createTrip(trip);
  }
}
