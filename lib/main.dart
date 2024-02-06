
import 'package:flutter/material.dart';

import 'Routes/route_names.dart';
import 'Routes/route_navigations.dart';

void main() {
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: RouteNavigation.generateRoute,
      )
  );
}