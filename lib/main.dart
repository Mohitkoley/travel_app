import 'package:travel_app/core/shared/export/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(TripModelAdapter());
  await Hive.openBox<TripModel>(TripConstants.tipBoxName);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute().onGenerateRoute,
    );
  }
}
