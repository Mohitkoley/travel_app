import 'package:travel_app/core/shared/export/export.dart';

class TravelCard extends StatelessWidget {
  const TravelCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.onDelete,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  final String location;
  final VoidCallback onDelete;

  void showAlertDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Description"),
              backgroundColor: context.cardColor,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(description),
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        width: 300,
        padding: const EdgeInsets.all(12),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      showAlertDialogBox(context);
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.network(imageUrl,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Text("No image found"),
                        );
                      }),
                    ),
                  )),
              Expanded(
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(location, style: kTitleTextStyle),
                            Text(
                              date,
                              style: kTitleTextStyle,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7.0),
                              child: Text(
                                title,
                                style: kTitleTextStyle,
                              ),
                            ),
                            GestureDetector(
                                onTap: onDelete, child: Icon(Icons.delete)),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
