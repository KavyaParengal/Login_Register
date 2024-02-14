
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/edit_premium_video_api.dart';

import '../../Utilities/colors.dart';

class EditPremiumContent extends StatefulWidget {
  final int id;
  final String videoLink;
  final String title;
  final String description;
  final String advice;
  final int week;

   @override
   State<EditPremiumContent> createState() => _EditPremiumContentState();

  EditPremiumContent(
      {required this.id,
      required this.videoLink,
      required this.title,
      required this.description,
      required this.advice,
      required this.week});
}

 class _EditPremiumContentState extends State<EditPremiumContent> {

   TextEditingController videoController=TextEditingController();
   TextEditingController titleController=TextEditingController();
   TextEditingController descriptionController=TextEditingController();
   TextEditingController monthController=TextEditingController();
   TextEditingController adviceController=TextEditingController();

   @override
   void initState() {
    // TODO: implement initState
    super.initState();
    videoController.text = widget.videoLink;
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    monthController.text = widget.week.toString();
    adviceController.text = widget.advice;
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
           elevation: 0,
           title: Text(
             'Edit Premium Content',
             style: GoogleFonts.poppins(
               fontSize: 20,
               fontWeight: FontWeight.bold,
               color: Colors.white,
             ),
             textAlign: TextAlign.start,
           ),
         ),
       ),
       body: SingleChildScrollView(
         child: Column(
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
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Description",style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                   color: Colors.teal.shade800
               ),),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                 controller: descriptionController,
                 decoration: InputDecoration(
                     hintText: 'Description',
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12)
                     )
                 ),
               ),
             ),

             const SizedBox(height: 10,),
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

             const SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Advice",style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                   color: Colors.teal.shade800
               ),),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                 controller: adviceController,
                 decoration: InputDecoration(
                     hintText: 'Advice',
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
                     EditPremiumContentApi.editPremiumContent(
                         context,
                         videoController.text,
                         titleController.text,
                         descriptionController.text,
                         monthController.text,
                         adviceController.text,
                         widget.id);
                   // }
                 },
                     style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                     child: const Text("Edit",style: TextStyle(fontSize: 17, color: Colors.white),)),
               ),
             ),
           ],
         ),
       ),
     );;
   }
 }
