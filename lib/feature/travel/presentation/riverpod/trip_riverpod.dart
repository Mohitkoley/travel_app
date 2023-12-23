import 'dart:developer';

import 'package:travel_app/feature/travel/shared/export/trip_features_export.dart';

final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
  Box<TripModel> tripBox = Hive.box(TripConstants.tipBoxName);
  return TripLocalDataSource(tripBox: tripBox);
});

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  TripLocalDataSource tripLocalDataSource =
      ref.read(tripLocalDataSourceProvider);
  return TripRepositoryImpl(tripLocalDataSource);
});

final getTripsProvider = Provider<GetTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return GetTrips(repository);
});

final createTripProvider = Provider<CreateTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return CreateTrip(repository);
});

final getTripProvder = Provider<GetTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return GetTrip(repository);
});

final updateTripProvider = Provider<UpdateTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return UpdateTrip(repository);
});

final deleteProvider = Provider<DeleteTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTrip(repository);
});

final searchProvider = Provider<SearchTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return SearchTrip(repository);
});

final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrips = ref.read(getTripsProvider);
  final createTrip = ref.read(createTripProvider);
  final getTrip = ref.read(getTripProvder);
  final updateTrip = ref.read(updateTripProvider);
  final deleteTrip = ref.read(deleteProvider);
  final searchTrip = ref.read(searchProvider);
  return TripListNotifier(
      getTrips: getTrips,
      createTrip: createTrip,
      getTrip: getTrip,
      updateTrip: updateTrip,
      deleteTrip: deleteTrip,
      searchTrip: searchTrip);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrips getTrips;
  final CreateTrip createTrip;
  final GetTrip getTrip;
  final UpdateTrip updateTrip;
  final DeleteTrip deleteTrip;
  final SearchTrip searchTrip;

  TripListNotifier({
    required this.getTrips,
    required this.createTrip,
    required this.getTrip,
    required this.updateTrip,
    required this.deleteTrip,
    required this.searchTrip,
  }) : super([]) {
    getTripsList();
  }

  Future<void> getTripsList() async {
    final tripsOrFailure = await getTrips();
    tripsOrFailure.fold((failure) => state = [], (trips) => state = trips);
  }

  Future<void> createTripList(Trip trip) async {
    await createTrip(trip);
    await getTripsList();
  }

  Future<void> getTripList(String tripId) async {
    final trip = await getTrip(tripId);
    state = [trip];
  }

  Future<void> updateTripList(Trip trip) async {
    await updateTrip(trip);
    await getTripsList();
  }

  Future<void> deleteTripList(int tripId) async {
    await deleteTrip(tripId);
    await getTripsList();
  }

  Future<void> searchTripList(String query) async {
    log("query is $query");
    final tripsOrFailure = await searchTrip(query);
    tripsOrFailure.fold((failure) => state = [], (trips) => state = trips);
  }
}
