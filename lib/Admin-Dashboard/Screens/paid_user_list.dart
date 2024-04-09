
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Provider/paid_users_list_provider.dart';
import 'package:login_register/Utilities/state_enum.dart';
import 'package:provider/provider.dart';

import '../../Utilities/colors.dart';
import '../../Utilities/global.dart';
import '../../Widgets/error_refresh_icon.dart';
import '../../Widgets/loading_icon.dart';
import 'admin_home_page.dart';

class PaidUserList extends StatefulWidget {
  const PaidUserList({super.key});

  @override
  State<PaidUserList> createState() => _PaidUserListState();
}

class _PaidUserListState extends State<PaidUserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: appBarColor
            ),
          ),
          elevation: 0,
          title: Text(
            Global().appName,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white,)
          ),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));
                },
                icon: Icon(Icons.home, color: Colors.white,)
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Center(
            child: ChangeNotifierProvider(create: (context) => PaidUsersController(context),
              child: Consumer<PaidUsersController> (
                builder: (context, controller, child){
                  return controller.state == StateEnum.loading
                      ? Container(
                          height: 1000,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Center(child: LoadingIcon()),
                        ) : controller.state == StateEnum.success ? (controller.paidUsers != null || controller.paidUsers.isNotEmpty) ?
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Premium Users',
                          style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.paidUsers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: MediaQuery.of(context).size.height/5,
                              margin: const EdgeInsets.all(12.0),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                gradient: RadialGradient(
                                  colors: <Color>[ Colors.white, Colors.teal.shade100],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text('${(index+1)}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text('${controller.paidUsers[index].id.toString()[0].toUpperCase()}${controller.paidUsers[index].id.toString().substring(1).toLowerCase()}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),),
                                          ],
                                        ),
                                        // Icon(clientList[index].subscribed == true ? FontAwesomeIcons.crown : null, color: Colors.teal.shade700,) ,
                                      ],
                                    ),
                                Text('${controller.paidUsers[index].date.toString()}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),),
                                    Text(controller.paidUsers[index].plan.toString(),style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),),
                                  ],
                                ),
                              )
                          );
                        },
                      ),
                    ],
                  ) : Center(
                    child: Text(
                      "No Clients Available",
                      style: TextStyle(
                        fontSize: 15,
                        color: button,
                        fontFamily: 'Arial',
                      ),
                    ),
                  )
                      : Center(
                    child: ErrorRefreshIcon(onPressed: () {
                      controller.fetchAllPaidUsers();
                    }),
                  );
                },
              ),
            )
        ),
      ),
    );
  }
}
