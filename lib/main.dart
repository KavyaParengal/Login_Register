
import 'package:flutter/material.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_free_video_provider.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_paid_video_provider.dart';
import 'package:login_register/Admin-Dashboard/Provider/client_list_provider.dart';
import 'package:login_register/Client-Dashboard/Provider/free_content_provider.dart';
import 'package:login_register/Client-Dashboard/Provider/plan_list_provider.dart';
import 'package:login_register/Client-Dashboard/Provider/premium_content_provider.dart';
import 'package:login_register/Client-Dashboard/Routes/route_names.dart';
import 'package:login_register/Client-Dashboard/Routes/route_navigations.dart';
import 'package:login_register/Client-Dashboard/Utilities/colors.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'Admin-Dashboard/Provider/admin_view_wee_wise_provider.dart';


void main() async {
  runApp(
      MultiProvider(
        providers:
        [
          ChangeNotifierProvider(create:  (context) => FreeContentDataProvider(),),
          ChangeNotifierProvider(create:  (context) => ClientListProvider(),),
          ChangeNotifierProvider(create:  (context) => PremiumContentDataProvider()),
          ChangeNotifierProvider(create:  (context) => PlanListProvider()),
          ChangeNotifierProvider(create:  (context) => AdminViewFreeVideoProvider()),
          ChangeNotifierProvider(create:  (context) => AdminViewPaidVideoProvider()),
          ChangeNotifierProvider(create:  (context) => AdminViewWeekWiseProvider())
        ],
        child: MaterialApp(
          // theme: ThemeData(
          //   inputDecorationTheme: InputDecorationTheme(
          //     focusColor: Colors.teal.shade200
          //   ),
          // ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.splashScreen,
          onGenerateRoute: RouteNavigation.generateRoute,
        ),
      )
  );
}