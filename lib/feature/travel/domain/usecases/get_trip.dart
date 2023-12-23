import 'package:travel_app/feature/travel/shared/export/trip_features_export.dart';

class GetTrip {
  final TripRepository _tripRepository;

  GetTrip(this._tripRepository);

  Future<Trip> call(String tripId) async {
    return await _tripRepository.getTrip(tripId);
  }
}
