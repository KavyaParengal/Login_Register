
import 'package:flutter/material.dart';
import 'package:login_register/Admin-Dashboard/Screens/add_banner.dart';
import 'package:login_register/Admin-Dashboard/Screens/add_premium_content.dart';
import 'package:login_register/Admin-Dashboard/Screens/add_free_videos.dart';
import 'package:login_register/Admin-Dashboard/Screens/add_week_wise_content.dart';
import 'package:login_register/Admin-Dashboard/Screens/add_price.dart';
import 'package:login_register/Admin-Dashboard/Screens/add_workshop_video.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_home_page.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_view_banners.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_view_free_content.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_view_premium_content.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_view_price_plan.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_view_workshop_video.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_free_content.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_premium_content.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_price_plan.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_week_wise_content.dart';
import 'package:login_register/Admin-Dashboard/Screens/view_clients.dart';
import 'package:login_register/Routes/route_names.dart';
import 'package:login_register/Client-Dashboard/Screens/ProfileDetails.dart';
import 'package:login_register/Client-Dashboard/Screens/freecontent.dart';
import 'package:login_register/Client-Dashboard/Screens/premium_plan_page.dart';
import 'package:login_register/Client-Dashboard/Screens/premiumcontent.dart';
import 'package:login_register/Routes/route_names.dart';

import '../../Admin-Dashboard/Screens/admin_view_week_wise_content.dart';
import '../Client-Dashboard/Screens/add_menstration_date.dart';
import '../Client-Dashboard/Screens/home_page.dart';
import '../Client-Dashboard/Screens/login_page.dart';
import '../Client-Dashboard/Screens/sign_up_page.dart';
import '../Client-Dashboard/Screens/splash_screen.dart';


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

      case RouteName.profileDetails:
        return MaterialPageRoute(builder: (context)=> ProfileDetails());

      case RouteName.premium_plan:
        return MaterialPageRoute(builder: (context)=> PremiumPlanPage());


///////////////// ADMIN PORT /////////////////////

      case RouteName.admin_home:
        return MaterialPageRoute(builder: (context)=>const AdminHomePage());

      case RouteName.add_free_content:
        return MaterialPageRoute(builder: (context)=>const AdminAddVideos());

      case RouteName.add_premium_content:
        return MaterialPageRoute(builder: (context)=>const AddPremiumContent());

      case RouteName.view_client:
        return MaterialPageRoute(builder: (context)=>const ViewClients());

      case RouteName.add_price:
        return MaterialPageRoute(builder: (context)=>const AddPremiumPrice());

      case RouteName.add_week_wise_content:
        return MaterialPageRoute(builder: (context)=>const AddWeekWiseContent());

      case RouteName.add_banners:
        return MaterialPageRoute(builder: (context)=>const AddBanners());

      case RouteName.add_workshop_videos:
        return MaterialPageRoute(builder: (context)=>const AddWorkShopVideos());

      // case RouteName.edit_free_content:
      //   return MaterialPageRoute(builder: (context)=>const EditFreeContent());
      //
      // case RouteName.edit_premium_content:
      //   return MaterialPageRoute(builder: (context)=>const EditPremiumContent());

      // case RouteName.edit_price:
      //   return MaterialPageRoute(builder: (context)=>const EditPricePlan());

      // case RouteName.edit_week_wise_content:
      //   return MaterialPageRoute(builder: (context)=>const EditWeekWiseContent());

      case RouteName.admin_view_price_plan:
        return MaterialPageRoute(builder: (context)=>const AdminViewPricePlan());

      case RouteName.admin_view_week_wise_content:
        return MaterialPageRoute(builder: (context)=> AdminViewWeekWiseContent());

      case RouteName.admin_view_free_content:
        return MaterialPageRoute(builder: (context)=> AdminViewFreeContent());

      case RouteName.admin_view_premium_content:
        return MaterialPageRoute(builder: (context)=> AdminViewPremiumContent());

      case RouteName.admin_view_workshop_videos:
        return MaterialPageRoute(builder: (context)=> AdminViewWorkshopVideo());

      case RouteName.admin_view_banners:
        return MaterialPageRoute(builder: (context)=> AdminViewBanners());

      default:
        return MaterialPageRoute(builder: (context)=>Scaffold(
          body: Center(
            child: Text('No Route Found ${settings.name}'),
          ),
        ));
    }
  }
}