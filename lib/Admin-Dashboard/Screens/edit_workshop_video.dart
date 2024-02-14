import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/edit_workshop_video_api.dart';

import '../../Utilities/colors.dart';

class EditWorkshopVideo extends StatefulWidget {
  final int id;
  final String videoLink;

  @override
  State<EditWorkshopVideo> createState() => _EditWorkshopVideoState();

  EditWorkshopVideo({required this.id, required this.videoLink});
}

class _EditWorkshopVideoState extends State<EditWorkshopVideo> {

  TextEditingController videoController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController.text = widget.videoLink;
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
            'Edit Workshop Videos',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Video Link",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: videoController,
              decoration: InputDecoration(
                  hintText: "Video Link",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
            ),
          ),

          const SizedBox(height: 36,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(onPressed: (){
                  EditWorkshopVideoApi.editWorkshopVideo(
                      context,
                      videoController.text,
                      widget.id
                  );
              },
                  style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                  child: const Text("Edit",style: TextStyle(fontSize: 17,  color: Colors.white),)),
            ),
          ),
        ],
      ),
    );
  }
}
