import 'package:travel_app/core/shared/export/export.dart';
import 'package:travel_app/feature/travel/shared/export/trip_features_export.dart';

class TripLocalDataSource {
  final Box<TripModel> tripBox;

  TripLocalDataSource({required this.tripBox});

  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  Future<TripModel> getTrip(String tripId) async {
    return tripBox.values.firstWhere((trip) => trip.title == tripId);
  }

  createTrip(TripModel trip) async {
    await tripBox.add(trip);
  }

  updateTrip(TripModel trip) async {
    await tripBox.putAt(tripBox.values.toList().indexOf(trip), trip);
  }

  Future<void> deleteTrip(int index) async {
    await tripBox.deleteAt(index);
  }

  List<TripModel> searchTrip(String query) {
    if (query.isEmpty) {
      return tripBox.values.toList();
    } else {
      return tripBox.values
          .where((trip) =>
              trip.title.toLowerCase().contains(query.toLowerCase()) ||
              trip.location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
