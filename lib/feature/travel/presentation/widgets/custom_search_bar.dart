import 'package:travel_app/core/shared/export/export.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key, required this.ref});
  final TextEditingController _searchController = TextEditingController();
  WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search destination.....",
                border: InputBorder.none,
              ),
              onChanged: (value) =>
                  ref.read(tripListNotifierProvider.notifier).searchTrip(value),
            ))
          ],
        ));
  }
}
