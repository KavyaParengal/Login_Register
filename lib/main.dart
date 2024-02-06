
import 'package:flutter/material.dart';
import 'package:login_register/CLIENT/Routes/route_names.dart';
import 'package:login_register/CLIENT/Routes/route_navigations.dart';


void main() {
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.splashScreen,
        onGenerateRoute: RouteNavigation.generateRoute,
      )
  );
}