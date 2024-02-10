
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Client-Dashboard/Utilities/colors.dart';

class EditWeekWiseContent extends StatefulWidget {
  const EditWeekWiseContent({super.key});

  @override
  State<EditWeekWiseContent> createState() => _EditWeekWiseContentState();
}

class _EditWeekWiseContentState extends State<EditWeekWiseContent> {

  TextEditingController monthController=TextEditingController();
  TextEditingController imageController=TextEditingController();
  TextEditingController sizeController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController lengthController=TextEditingController();
  TextEditingController weightController=TextEditingController();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                        //image.toString() == null ? Text('Select Image'): Text(image.toString()),
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
              child: ElevatedButton(onPressed: (){
                // if (_formKey.currentState!.validate()) {
                //   AddWeekWiseContentApi.addWeekWiseContent(context,
                //       monthController.text.trim(),
                //       imageName.toString() ?? '',
                //       sizeController.text.trim(),
                //       descriptionController.text.trim(),
                //       lengthController.text.trim(),
                //       weightController.text.trim()
                //   );
                //   print('--------${basename(image!.path)}');
                // }
              },
                  style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                  child: const Text("Add",style: TextStyle(fontSize: 17, color: Colors.white),)),
            ),
          ),
        ],
      ),
    );;
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
                    // getImage(ImageSource.gallery);
                  },
                  child: Text("Gallery"),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    // getImage(ImageSource.camera);
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
