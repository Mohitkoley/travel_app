import 'package:travel_app/feature/travel/shared/export/trip_features_export.dart';

class DeleteTrip {
  final TripRepository _tripRepository;

  DeleteTrip(this._tripRepository);

  Future<void> call(int tripId) async {
    return await _tripRepository.deleteTrip(tripId);
  }
}
