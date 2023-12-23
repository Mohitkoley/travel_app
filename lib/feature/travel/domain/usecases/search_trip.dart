import 'package:travel_app/core/shared/export/export.dart';

class SearchTrip {
  final TripRepository _tripRepository;

  SearchTrip(this._tripRepository);

  Future<Either<Failure, List<Trip>>> call(String params) async {
    return await _tripRepository.searchTrip(params);
  }
}
