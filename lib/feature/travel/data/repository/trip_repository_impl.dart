import 'package:travel_app/core/shared/export/export.dart';

class TripRepositoryImpl implements TripRepository {
  final TripLocalDataSource _tripLocalDataSource;

  TripRepositoryImpl(this._tripLocalDataSource);

  @override
  Future<void> createTrip(Trip trip) async {
    final TripModel tripModel = TripModel.fromEntity(trip);
    _tripLocalDataSource.createTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int tripId) async {
    _tripLocalDataSource.deleteTrip(tripId);
  }

  @override
  Future<Trip> getTrip(String tripId) async {
    final TripModel tripModel = await _tripLocalDataSource.getTrip(tripId);
    return tripModel.toEntity();
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      final List<TripModel> tripModels = _tripLocalDataSource.getTrips();
      List<Trip> trips =
          tripModels.map((tripModel) => tripModel.toEntity()).toList();
      return Right(trips);
    } catch (err) {
      return Left(SomeSpecificFailure(err.toString()));
    }
  }

  @override
  Future<void> updateTrip(Trip trip) async {
    _tripLocalDataSource.updateTrip(TripModel.fromEntity(trip));
  }

  @override
  Future<Either<Failure, List<Trip>>> searchTrip(String query) async {
    try {
      final List<TripModel> tripModels = _tripLocalDataSource.searchTrip(query);
      List<Trip> trips =
          tripModels.map((tripModel) => tripModel.toEntity()).toList();
      return Right(trips);
    } catch (err) {
      return Left(SomeSpecificFailure(err.toString()));
    }
  }
}
