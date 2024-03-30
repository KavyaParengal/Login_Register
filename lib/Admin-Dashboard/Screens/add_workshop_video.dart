
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/add_workshop_video_api.dart';

import '../../Utilities/colors.dart';

class AddWorkShopVideos extends StatefulWidget {
  const AddWorkShopVideos({super.key});

  @override
  State<AddWorkShopVideos> createState() => _AddWorkShopVideosState();
}

class _AddWorkShopVideosState extends State<AddWorkShopVideos> {

  TextEditingController videoController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

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
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white,)
          ),
          elevation: 0,
          title: Text(
            'Add Workshop Videos',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(height: 36,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(onPressed: () async{
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    await AddWorkshopVideoApi.addWorkshopVideo(context, videoController.text);
                    setState(() {
                      _isLoading = false;
                    });
                  }
                },
                    style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                    child: _isLoading ? CircularProgressIndicator(color: Colors.white,) : Text("Add",style: TextStyle(fontSize: 17,  color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
