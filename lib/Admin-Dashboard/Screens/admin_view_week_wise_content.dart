import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/delete_week_wise_content_api.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_wee_wise_provider.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_week_wise_content.dart';
import 'package:login_register/Utilities/constants.dart';
import 'package:login_register/Utilities/global.dart';
import 'package:provider/provider.dart';

import '../../Utilities/colors.dart';
import '/Widgets/loading_icon.dart';
import 'admin_home_page.dart';

class AdminViewWeekWiseContent extends StatefulWidget {
  @override
  State<AdminViewWeekWiseContent> createState() => _AdminViewWeekWiseContentState();
}

class _AdminViewWeekWiseContentState extends State<AdminViewWeekWiseContent> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AdminViewWeekWiseProvider>(context, listen: false).getWeekWiseList();
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
                color: appBarColor),
          ),
          elevation: 0,
          title: Text(
            'Week Wise Contents',
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
              icon: Icon(Icons.arrow_back, color: Colors.white,)
          ),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));
                },
                icon: Icon(Icons.home,color: Colors.white,)
            )
          ],
        ),
      ),
      body: Consumer<AdminViewWeekWiseProvider>(
        builder: (context, value, child){
          if (value.isLoading) {
            return const Center(
                child: LoadingIcon()
            );
          }
          final weekWiseList = value.weekWiseData;
          return weekWiseList.isEmpty ? Center(
            child: Text('No Week Wise Content Available',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.teal.shade600,
              ),
            ),
          ) : ListView.builder(
            shrinkWrap: true,
            itemCount: weekWiseList.length,
            itemBuilder: (context, index){
              return Container(
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
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(APIConstants.baseUrl + weekWiseList[index].image.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(text: TextSpan(children:[
                        TextSpan(text: "Week : ",style: TextStyle(
                            color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                        TextSpan(text: weekWiseList[index].month.toString(),style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16))
                      ])),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(text: TextSpan(children:[
                        TextSpan(text: "Size : ",style: TextStyle(
                            color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                        TextSpan(text: '${weekWiseList[index].size}' ?? 'Not given',style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)
                        )
                      ])),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(text: TextSpan(children:[
                        TextSpan(text: "Description : ",style: TextStyle(
                            color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                        TextSpan(text: Global().capitalizeAllWord(weekWiseList[index].description) ?? 'Not given',style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16))
                      ])),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(text: TextSpan(children:[
                        TextSpan(text: "Length : ",style: TextStyle(
                            color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                        TextSpan(text: weekWiseList[index].length,style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)
                        )
                      ])),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(text: TextSpan(children:[
                        TextSpan(text: "Weight : ",style: TextStyle(
                            color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                        TextSpan(text: weekWiseList[index].weight,style: TextStyle(
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditWeekWiseContent(
                                  id: weekWiseList[index].id??0,
                                  image: weekWiseList[index].image??'',
                                  week: weekWiseList[index].month??0,
                                  size: weekWiseList[index].size??'',
                                  description: weekWiseList[index].description??'',
                                  lenght: weekWiseList[index].length??'',
                                  weight: weekWiseList[index].weight??"",
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
                                            DeleteWeekWiseContent.deleteWeekWiseContent(context, weekWiseList[index].id.toString());
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
              );
            },
          );
        }
      ),
    );
  }
}
