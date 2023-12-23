import 'package:travel_app/core/shared/export/package_export.dart';

extension ContextExt on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  void showSnack(String msg) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
          backgroundColor: Colors.red,
          content: Text(msg),
          dismissDirection: DismissDirection.horizontal),
    );
  }

  Color get cardColor => Theme.of(this).cardColor;

  TextTheme textTheme() => Theme.of(this).textTheme;
}

extension DateTimeExt on DateTime {
  String get formattedDate => DateFormat.yMMMd().format(this);
}
