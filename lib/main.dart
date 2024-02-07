
import 'package:flutter/material.dart';
import 'package:login_register/CLIENT/Provider/free_content_provider.dart';
import 'package:login_register/CLIENT/Routes/route_names.dart';
import 'package:login_register/CLIENT/Routes/route_navigations.dart';
import 'package:provider/provider.dart';


void main() async {
  runApp(
      ChangeNotifierProvider(
        create: (context) => FreeContentDataProvider(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.splashScreen,
          onGenerateRoute: RouteNavigation.generateRoute,
        ),
      )
  );
}