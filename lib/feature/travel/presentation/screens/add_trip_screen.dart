import 'package:travel_app/feature/travel/shared/export/trip_export.dart';

class AddTripScreen extends ConsumerWidget {
  AddTripScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _pictureController = TextEditingController();
  final pictureProvider = StateProvider<List<String>>((ref) => []);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            AddTripWidget(controller: _titleController, label: "Title"),
            AddTripWidget(
                controller: _descriptionController, label: "Description"),
            AddTripWidget(controller: _locationController, label: "Location"),
            AddTripWidget(controller: _pictureController, label: "Picture"),
            ElevatedButton(
                onPressed: () {
                  ref
                      .read(pictureProvider.notifier)
                      .update((state) => [...state, _pictureController.text]);
                  if (_formKey.currentState!.validate()) {
                    final newTrip = Trip(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        location: _locationController.text,
                        photos: ref.watch(pictureProvider.notifier).state,
                        date: DateTime.now());
                    ref
                        .read(tripListNotifierProvider.notifier)
                        .createTripList(newTrip)
                        .then((value) {
                      _descriptionController.clear();
                      _titleController.clear();
                      _locationController.clear();
                      _pictureController.clear();
                    });
                  }
                },
                child: const Text("Add Trip")),
          ],
        ));
  }
}
