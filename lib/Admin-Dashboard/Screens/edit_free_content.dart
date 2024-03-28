
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/edit_free_video_api.dart';

import '../../Utilities/colors.dart';

class EditFreeContent extends StatefulWidget {
  final int id;
  final String title;
  final String videoLink;
  final int week;

  @override
  State<EditFreeContent> createState() => _EditFreeContentState();

  EditFreeContent({
    required this.id,
    required this.title,
    required this.videoLink,
    required this.week});
}

class _EditFreeContentState extends State<EditFreeContent> {

  TextEditingController videoController=TextEditingController();
  TextEditingController titleController=TextEditingController();
  // TextEditingController descriptionController=TextEditingController();
  TextEditingController monthController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController.text = widget.videoLink;
    titleController.text = widget.title;
    monthController.text = widget.week.toString();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white,),
          ),
          elevation: 0,
          title: Text(
            'Edit Free Content',
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
                  hintText: 'Video Link',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
            ),
          ),

          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Title",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
            ),
          ),

          const SizedBox(height: 10,),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFormField(
          //     controller: descriptionController,
          //     decoration: InputDecoration(
          //         hintText: "Description",
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(12)
          //         )
          //     ),
          //   ),
          // ),
          //
          // const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Week",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: monthController,
              decoration: InputDecoration(
                  hintText: 'Week',
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
                // if (_formKey.currentState!.validate()) {
                  EditFreeContentApi.editFreeContent(context,
                      videoController.text.trim(),
                      titleController.text.trim(),
                      // descriptionController.text.trim(),
                      monthController.text.trim(),
                      widget.id
                  );
                // }
              },
                  style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                  child: const Text("Edit",style: TextStyle(fontSize: 17,  color: Colors.white),)),
            ),
          ),
        ],
      ),
    );;
  }
}
