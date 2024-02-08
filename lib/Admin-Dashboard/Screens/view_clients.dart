
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Client-Dashboard/Utilities/colors.dart';
import '../Provider/client_list_provider.dart';

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
            'Client List',
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
              icon: Icon(Icons.arrow_back)
          ),
        ),
      ),
      body: Center(
        child: Consumer<ClientListProvider> (
          builder: (context, value, child){
            if (value.isLoading) {
              return Center(
                  child: CircularProgressIndicator(color: primary,)
              );
            }
            final clientList = value.clientList;
            return GridView.builder(
              shrinkWrap: true,
              itemCount: clientList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Container(
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
                            Row(
                              children: [
                                Text(clientList[index].firstName.toString(),style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                                SizedBox(width: 8,),
                                Text(clientList[index].lastName.toString(),style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                              ],
                            ),
                            Text(clientList[index].location.toString(),style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                            Text(clientList[index].mobile.toString(),style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                            Text(clientList[index].email.toString(),style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                          ],
                        ),
                      )
                  ),
                );
              },
            );
          },
        )
      ),
    );
  }
}
