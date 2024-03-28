
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Routes/route_names.dart';
import 'package:login_register/Utilities/global.dart';
import 'package:provider/provider.dart';
import '../../Utilities/colors.dart';
import '../Provider/client_list_provider.dart';
import 'admin_home_page.dart';

class ViewClients extends StatefulWidget {
  const ViewClients({super.key});

  @override
  State<ViewClients> createState() => _ViewClientsState();
}

class _ViewClientsState extends State<ViewClients> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ClientListProvider>(context, listen: false).getClientList();
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
          child: Consumer<ClientListProvider> (
            builder: (context, value, child){
              if (value.isLoading) {
                return Center(
                    child: CircularProgressIndicator(color: primary,)
                );
              }
              final clientList = value.clientList;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Client List',
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
                    itemCount: clientList.length,
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
                                  children: [
                                    clientList[index].firstName == null ||  clientList[index].firstName == '' ? Text('Null', style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),):Text('${clientList[index].firstName.toString()[0].toUpperCase()}${clientList[index].firstName.toString().substring(1).toLowerCase()}',
                                      style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),),
                                    SizedBox(width: 8,),
                                    clientList[index].lastName == null || clientList[index].lastName == '' ? Text('Null', style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),):Text('${clientList[index].lastName.toString()[0].toUpperCase()}${clientList[index].lastName.toString().substring(1).toLowerCase()}',
                                      style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),),
                                  ],
                                ),
                                clientList[index].location == null ? Text('Null', style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),):Text('${clientList[index].location.toString()[0].toUpperCase()}${clientList[index].location.toString().substring(1).toLowerCase()}',
                                  style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                                clientList[index].mobile == null ? Text('Null', style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),):Text(clientList[index].mobile.toString(),style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                                clientList[index].email == null ? Text('Null', style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),):Text(clientList[index].email.toString(),style: GoogleFonts.poppins(
                                  fontSize: 13,
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
              );
            },
          )
        ),
      ),
    );
  }
}
