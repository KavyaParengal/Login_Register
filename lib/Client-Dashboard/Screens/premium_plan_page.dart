
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Client-Dashboard/Provider/plan_list_provider.dart';
import 'package:login_register/Client-Dashboard/Routes/route_names.dart';
import 'package:login_register/Client-Dashboard/Utilities/global.dart';
import 'package:provider/provider.dart';

import '../Utilities/colors.dart';
import '../Widgets/loading_icon.dart';

class PremiumPlanPage extends StatefulWidget {
  const PremiumPlanPage({super.key});

  @override
  State<PremiumPlanPage> createState() => _PremiumPlanPageState();
}

class _PremiumPlanPageState extends State<PremiumPlanPage> {

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PlanListProvider>(context, listen: false).getPlanList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.teal.shade500, Colors.teal.shade500, Colors.black]
                    )
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
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back
                )
            ),
          )),
      body: Consumer<PlanListProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
                child: LoadingIcon()
            );
          }
          final planList = value.planList;
          return planList == null ? Center(
            child: Text('No Payment Plans Available',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ) : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Plan List',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: planList.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal,
                            offset: Offset(1.1, 3),
                            blurRadius: 2,
                            spreadRadius: 1
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              RichText(text: TextSpan(children:[
                                  TextSpan(text: "Plan Type : ",style: TextStyle(
                                      color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                                  TextSpan(text:planList[index].plan??'not Given',style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16))
                                ])),

                                RichText(text: TextSpan(children:[
                                  TextSpan(text: "Amount : ",style: TextStyle(
                                      color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                                  TextSpan(text:planList[index].price.toString()??'0',style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)
                                  )
                                ])),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                //Navigator.pushNamed(context, RouteName.premium_content);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: button, // foreground (text) color
                                  shape: ContinuousRectangleBorder()
                              ),
                              child: Text(
                                " Pay Now ",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ],
          );
        }
      ),
    );
  }
}
