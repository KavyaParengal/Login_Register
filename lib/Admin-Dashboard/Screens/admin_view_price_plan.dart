
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/delete_plan_list.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_price_plan.dart';
import 'package:login_register/Client-Dashboard/Utilities/global.dart';
import 'package:provider/provider.dart';

import '../../Client-Dashboard/Provider/plan_list_provider.dart';
import '../../Client-Dashboard/Routes/route_names.dart';
import '../../Client-Dashboard/Utilities/colors.dart';
import '../../Client-Dashboard/Widgets/loading_icon.dart';

class AdminViewPricePlan extends StatefulWidget {
  const AdminViewPricePlan({super.key});

  @override
  State<AdminViewPricePlan> createState() => _AdminViewPricePlanState();
}

class _AdminViewPricePlanState extends State<AdminViewPricePlan> {

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
              'Plan List',
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
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RouteName.admin_home);
                  },
                  icon: Icon(Icons.home,color: Colors.white,)
              )
            ],
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
            ) : ListView.builder(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RichText(text: TextSpan(children:[
                              TextSpan(text: "Plan Type    : ",style: TextStyle(
                                  color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                              TextSpan(text: '${Global().capitalizeAllWord(planList[index].plan ?? 'not Given')}',style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16))
                            ])),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RichText(text: TextSpan(children:[
                              TextSpan(text: "Amount        : ",style: TextStyle(
                                  color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                              TextSpan(text:planList[index].price.toString()??'0',style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)
                              )
                            ])),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RichText(text: TextSpan(children:[
                              TextSpan(text: "Description : ",style: TextStyle(
                                  color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                              TextSpan(text: planList[index].description ?? 'Not given',style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)
                              )
                            ])),
                          ),
                          // Row(
                          //   children: [
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.all(5.0),
                          //           child: Text('Plan Type ',style: TextStyle(
                          //               color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.all(5.0),
                          //           child: Text('Price ',style: TextStyle(
                          //               color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.all(5.0),
                          //           child: Text('Description ',style: TextStyle(
                          //               color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                          //         )
                          //       ],
                          //     ),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.all(5.0),
                          //           child: Text(' : ',style: TextStyle(
                          //               color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.all(5.0),
                          //           child: Text(' : ',style: TextStyle(
                          //               color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.all(5.0),
                          //           child: Text(' : ',style: TextStyle(
                          //               color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                          //         )
                          //       ],
                          //     ),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       //  mainAxisAlignment: MainAxisAlignment.start,
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.all(5.0),
                          //           child: Text('${Global().capitalizeAllWord(planList[index].plan??'not Given')} ',style: TextStyle(
                          //               color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.all(5.0),
                          //           child: Text('${planList[index].price??'0'} ',style: TextStyle(
                          //               color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.all(5.0),
                          //           child: Container(
                          //             constraints: BoxConstraints(
                          //               // maxWidth: MediaQuery.of(context).size.width/2
                          //             ),
                          //             child: Text('Plan Type Plan Type Plan Type Plan Type  ',style: TextStyle(
                          //                 color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                          //                 maxLines: 14,
                          //             ),
                          //           ),
                          //         )
                          //       ],
                          //     )
                          //   ],
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.teal.shade500),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditPricePlan()));
                                    },
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                      onPressed: () {
                                        DeletePlanItem.deletePlanItem(context, planList[index].id.toString());
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            );
          }
      ),
    );
  }
}
