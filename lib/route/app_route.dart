import 'package:flutter/material.dart';

import 'package:travel_app/route/route_export.dart';

class AppRoute {
  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteNames.tripScreen:
        return MaterialPageRoute(builder: (_) => const MyTripScreen());
      case RouteNames.addTrip:
        return MaterialPageRoute(builder: (_) => AddTripScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('Page not found'),
                  ),
                ));
    }
  }
}
