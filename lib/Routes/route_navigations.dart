
import 'package:flutter/material.dart';
import 'package:login_register/Routes/route_names.dart';
import 'package:login_register/Screens/add_menstration_date.dart';
import 'package:login_register/Screens/home_page.dart';
import 'package:login_register/Screens/sign_up_page.dart';
import 'package:login_register/Screens/splash_screen.dart';

import '../Screens/login_page.dart';

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

      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Center(
            child: Text('No Route Found ${settings.name}'),
          ),
        ));
    }
  }
}