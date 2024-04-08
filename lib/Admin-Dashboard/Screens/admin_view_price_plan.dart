
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/delete_plan_list.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_price_plan.dart';
import 'package:login_register/Utilities/global.dart';
import 'package:provider/provider.dart';

import '../../Client-Dashboard/Provider/plan_list_provider.dart';
import '../../Utilities/colors.dart';
import '/Widgets/loading_icon.dart';
import 'admin_home_page.dart';

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
                    Icons.arrow_back, color: Colors.white,
                )
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));
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
            return planList.isEmpty ? Center(
              child: Text('No Payment Plans Available',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.teal.shade600,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.teal.shade500),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditPricePlan(
                                        id: planList[index].id??0,
                                        paymentType: planList[index].plan??'',
                                        price: planList[index].price??0,
                                        description: planList[index].description??'Not given'
                                      )));
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
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text('Are you Sure?'),
                                            content: const Text('Once you delete this item, You will not be able to recover this !'),
                                            actions: [
                                              TextButton(
                                                onPressed: () async {
                                                  DeletePlanItem.deletePlanItem(context, planList[index].id.toString());
                                                },
                                                child: Text("Delete",
                                                  style: TextStyle(
                                                      color: button,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Cancel",
                                                  style: TextStyle(
                                                      color: button,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
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
