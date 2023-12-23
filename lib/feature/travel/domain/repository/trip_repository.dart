import 'package:travel_app/core/shared/export/export.dart';

abstract class TripRepository {
  Future<Either<Failure, List<Trip>>> getTrips();
  Future<Trip> getTrip(String tripId);
  Future<void> createTrip(Trip trip);
  Future<void> updateTrip(Trip trip);
  Future<void> deleteTrip(int tripId);
  Future<Either<Failure, List<Trip>>> searchTrip(String query);
}
