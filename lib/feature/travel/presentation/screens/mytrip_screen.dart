import 'package:travel_app/core/shared/export/export.dart';

class MyTripScreen extends ConsumerWidget {
  const MyTripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Trip> tripList = ref.watch(tripListNotifierProvider);

    return Column(
      children: [
        CustomSearchBar(
          ref: ref,
        ),
        Expanded(
          child: tripList.isEmpty
              ? const Center(child: Text("No trip added yet"))
              : ListView.builder(
                  itemCount: tripList.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    Trip trip = tripList[index];

                    return TravelCard(
                        imageUrl: trip.photos[0],
                        title: trip.title,
                        description: trip.description,
                        date: trip.date.formattedDate,
                        location: trip.location,
                        onDelete: () {
                          ref
                              .read(tripListNotifierProvider.notifier)
                              .deleteTripList(index);
                        });
                  },
                ),
        ),
      ],
    );
  }
}
