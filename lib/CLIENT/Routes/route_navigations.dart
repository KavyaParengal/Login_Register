
import 'package:flutter/material.dart';
import 'package:login_register/ADMIN/Screens/add_videos.dart';
import 'package:login_register/CLIENT/Routes/route_names.dart';
import 'package:login_register/CLIENT/Screens/freecontent.dart';
import 'package:login_register/CLIENT/Screens/premiumcontent.dart';

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

      case RouteName.add_video:
        return MaterialPageRoute(builder: (context)=>const AdminAddVideos());

      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Center(
            child: Text('No Route Found ${settings.name}'),
          ),
        ));
    }
  }
}