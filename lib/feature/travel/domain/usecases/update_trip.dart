import 'package:travel_app/feature/travel/shared/export/trip_features_export.dart';

class UpdateTrip {
  final TripRepository _tripRepository;

  UpdateTrip(this._tripRepository);

  Future call(Trip trip) async {
    return await _tripRepository.updateTrip(trip);
  }
}
