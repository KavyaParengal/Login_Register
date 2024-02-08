
import 'package:flutter/material.dart';
import 'package:login_register/Admin-Dashboard/Screens/add_videos.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_home_page.dart';
import 'package:login_register/Admin-Dashboard/Screens/view_clients.dart';
import 'package:login_register/Client-Dashboard/Routes/route_names.dart';
import 'package:login_register/Client-Dashboard/Screens/freecontent.dart';
import 'package:login_register/Client-Dashboard/Screens/premiumcontent.dart';
import 'package:login_register/Client-Dashboard/Routes/route_names.dart';

import '../Screens/add_menstration_date.dart';
import '../Screens/home_page.dart';
import '../Screens/login_page.dart';
import '../Screens/sign_up_page.dart';
import '../Screens/splash_screen.dart';

class RouteNavigation{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());

      case RouteName.login:
        return MaterialPageRoute(builder: (context)=>const LoginPage());

      case RouteName.add_menstration:
        return MaterialPageRoute(builder: (context)=>const AddMenstrationDate());

      case RouteName.signUp:
        return MaterialPageRoute(builder: (context)=>const SignUpPage());

      case RouteName.home:
        return MaterialPageRoute(builder: (context)=>const HomePage());

      case RouteName.free_content:
        return MaterialPageRoute(builder: (context)=> FreeContent());

      case RouteName.premium_content:
        return MaterialPageRoute(builder: (context)=> PremiumContent());


///////////////// ADMIN PORT /////////////////////

      case RouteName.admin_home:
        return MaterialPageRoute(builder: (context)=>const AdminHomePage());

      case RouteName.add_free_content:
        return MaterialPageRoute(builder: (context)=>const AdminAddVideos());

      case RouteName.view_client:
        return MaterialPageRoute(builder: (context)=>const ViewClients());

      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Center(
            child: Text('No Route Found ${settings.name}'),
          ),
        ));
    }
  }
}