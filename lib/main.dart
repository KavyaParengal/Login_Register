
import 'package:flutter/material.dart';
import 'package:login_register/ADMIN/Provider/client_list_provider.dart';
import 'package:login_register/CLIENT/Provider/free_content_provider.dart';
import 'package:login_register/CLIENT/Routes/route_names.dart';
import 'package:login_register/CLIENT/Routes/route_navigations.dart';
import 'package:provider/provider.dart';


void main() async {
  runApp(
      MultiProvider(
        providers:
        [
          ChangeNotifierProvider(create:  (context) => FreeContentDataProvider(),),
          ChangeNotifierProvider(create:  (context) => ClientListProvider(),)
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.splashScreen,
          onGenerateRoute: RouteNavigation.generateRoute,
        ),
      )
  );
}