
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Client-Dashboard/Utilities/colors.dart';

class EditPremiumContent extends StatefulWidget {
   const EditPremiumContent({super.key});

   @override
   State<EditPremiumContent> createState() => _EditPremiumContentState();
 }

 class _EditPremiumContentState extends State<EditPremiumContent> {

   TextEditingController videoController=TextEditingController();
   TextEditingController titleController=TextEditingController();
   TextEditingController descriptionController=TextEditingController();
   TextEditingController monthController=TextEditingController();

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
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
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

           const SizedBox(height: 10,),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
               controller: titleController,
               decoration: InputDecoration(
                   hintText: "Title",
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(12)
                   )
               ),
             ),
           ),

           const SizedBox(height: 10,),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
               controller: descriptionController,
               decoration: InputDecoration(
                   hintText: "Description",
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(12)
                   )
               ),
               validator: (value) {
                 if (value == null || value.trim().isEmpty) {
                   return 'This field is required';
                 }
                 return null;
               },
             ),
           ),

           const SizedBox(height: 10,),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
               controller: monthController,
               decoration: InputDecoration(
                   hintText: "Month",
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
                 //   AddPremiumContentApi.addPremiumContent(context,
                 //       videoController.text.trim(),
                 //       titleController.text.trim(),
                 //       descriptionController.text.trim(),
                 //       monthController.text.trim());
                 // }
               },
                   style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                   child: const Text("Edit",style: TextStyle(fontSize: 17, color: Colors.white),)),
             ),
           ),
         ],
       ),
     );;
   }
 }