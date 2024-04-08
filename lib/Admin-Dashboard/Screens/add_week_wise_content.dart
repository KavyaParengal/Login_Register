
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_register/Admin-Dashboard/Api_services/add_week_wise_content_api.dart';
import 'package:path/path.dart';

import '../../Utilities/colors.dart';
import '../Api_services/add_free_video_api.dart';

class AddWeekWiseContent extends StatefulWidget {
  const AddWeekWiseContent({super.key});

  @override
  State<AddWeekWiseContent> createState() => _AddWeekWiseContentState();
}

class _AddWeekWiseContentState extends State<AddWeekWiseContent> {

  TextEditingController monthController=TextEditingController();
  TextEditingController imageController=TextEditingController();
  TextEditingController sizeController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController lengthController=TextEditingController();
  TextEditingController weightController=TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  XFile? image;
  final ImagePicker picker = ImagePicker();
  String imageName = 'Select Image';

  Future<void> getImage(ImageSource source) async {
    try {
      XFile? pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          image = pickedImage;
          imageName = basename(image!.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
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
              icon: Icon(Icons.arrow_back, color: Colors.white,)
          ),
          elevation: 0,
          title: Text(
            'Add Week Wise Content',
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
                controller: monthController,
                decoration: InputDecoration(
                    hintText: "Week",
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
              child: InkWell(
                onTap: (){
                  _showImageSourceDialog(context);
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade500)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(imageName),
                        Icon(Icons.upload,color: primary,)
                      ],
                    ),
                  )
                ),
              ),
            ),

            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: sizeController,
                decoration: InputDecoration(
                    hintText: "Size",
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
                controller: lengthController,
                decoration: InputDecoration(
                    hintText: "Length (CM)",
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
                controller: weightController,
                decoration: InputDecoration(
                    hintText: "Weight (GRAM)",
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
                    await AddWeekWiseContentApi.addWeekWiseContent(context,
                        monthController.text.trim(),
                        image!.path,
                        sizeController.text.trim(),
                        descriptionController.text.trim(),
                        lengthController.text.trim(),
                        weightController.text.trim()
                    );
                    setState(() {
                      _isLoading = false;
                    });
                    print('--------${basename(image!.path)}');
                  }
                },
                    style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                    child: _isLoading ? CircularProgressIndicator(color: Colors.white,) : Text("Add",style: TextStyle(fontSize: 17, color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    getImage(ImageSource.gallery);
                  },
                  child: Text("Gallery"),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    getImage(ImageSource.camera);
                  },
                  child: Text("Camera"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
