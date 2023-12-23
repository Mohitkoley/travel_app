import 'package:travel_app/feature/travel/shared/export/trip_export.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar(
      {super.key, this.name = "Rockey", this.image = TripConstants.profileUrl});
  final String name;
  final String image;
  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: preferredSize.height,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello, $name'),
          const Text('Where are you going?'),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(image,
                fit: BoxFit.cover,
                height: 60,
                width: 60, errorBuilder: (context, error, stackTrace) {
              return const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30,
              );
            }),
          ),
        ),
      ],
    );
  }
}
