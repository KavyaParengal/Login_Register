
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/edit_premium_video_api.dart';
import 'package:provider/provider.dart';

import '../../Client-Dashboard/Provider/plan_list_provider.dart';
import '../../Utilities/GenericDropdown.dart';
import '../../Utilities/colors.dart';

class EditPremiumContent extends StatefulWidget {
  final int id;
  final String videoLink;
  final String title;
  final String description;
  final String advice;
  final int week;
  final String plan;

   @override
   State<EditPremiumContent> createState() => _EditPremiumContentState();

  EditPremiumContent(
      {required this.id,
        required this.videoLink,
        required this.title,
        required this.description,
        required this.advice,
        required this.week,
        required this.plan});
}

 class _EditPremiumContentState extends State<EditPremiumContent> {

   TextEditingController videoController=TextEditingController();
   TextEditingController titleController=TextEditingController();
   TextEditingController descriptionController=TextEditingController();
   TextEditingController monthController=TextEditingController();
   TextEditingController adviceController=TextEditingController();

   bool _isLoading = false;
   String _option = '';
   String _selectedPlanId = '';

   @override
   void initState() {
    // TODO: implement initState
    super.initState();
    videoController.text = widget.videoLink;
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    monthController.text = widget.week.toString();
    adviceController.text = widget.advice;
    // planController.text = widget.plan;
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
                 color: appBarColor
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

             const SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Plan Type",style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                   color: Colors.teal.shade800
               ),),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                     border: Border.all(color: Colors.grey,),
                     borderRadius: BorderRadius.circular(12)
                 ),
                 child: Consumer<PlanListProvider>(
                     builder: (context, value, child) {
                       var list = value.planList.map((e) => e.plan.toString()).toList();
                       var id = value.planList.map((e) => e.id.toString()).toList();
                       // _option = list.isNotEmpty ? list[0] : '';
                       // print(value.planList.map((e) => e));
                       return list.isNotEmpty ? Padding(
                           padding: EdgeInsets.all(8),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('Select Plan Type :  ',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade600, fontSize: 16),),
                               value.planList.isNotEmpty ? GenericDropdown<String>(
                                 options: value.planList.map((e) => e.plan.toString()).toList(),
                                 selectedValue: _option == ''?list[0]:_option,
                                 onChanged: (val) {
                                   setState(() {
                                     _option = val!;
                                     int index = list.indexOf(val);
                                     _selectedPlanId = id[index];
                                   });
                                 },
                               ): Text('data'),
                             ],
                           )
                       ):Container();
                     }
                 ),
               ),
             ),

             const SizedBox(height: 36,),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 width: MediaQuery.of(context).size.width,
                 child: ElevatedButton(onPressed: () async{
                   setState(() {
                     _isLoading = true;
                   });
                     await EditPremiumContentApi.editPremiumContent(context,
                         videoController.text,
                         titleController.text,
                         descriptionController.text,
                         monthController.text,
                         adviceController.text,
                         widget.id,
                         _selectedPlanId,
                     );
                     setState(() {
                       _isLoading = true;
                     });
                 },
                     style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                     child: _isLoading ? CircularProgressIndicator(color: Colors.white,) : Text("Edit",style: TextStyle(fontSize: 17, color: Colors.white),)),
               ),
             ),
           ],
         ),
       ),
     );;
   }
 }
