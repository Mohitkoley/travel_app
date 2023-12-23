import 'package:travel_app/core/shared/export/export.dart';

class GetTrips {
  final TripRepository _tripRepository;

  GetTrips(this._tripRepository);

  Future<Either<Failure, List<Trip>>> call() async {
    return await _tripRepository.getTrips();
  }
}
