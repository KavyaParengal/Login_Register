
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_register/Admin-Dashboard/Api_services/edit_week_wise_content_api.dart';
import 'package:path/path.dart';

import '../../Utilities/colors.dart';

class EditWeekWiseContent extends StatefulWidget {
  final int id;
  final String image;
  final int week;
  final String size;
  final String description;
  final String lenght;
  final String weight;

  @override
  State<EditWeekWiseContent> createState() => _EditWeekWiseContentState();

  EditWeekWiseContent(
      {required this.id,
        required this.image,
        required this.week,
        required this.size,
        required this.description,
        required this.lenght,
        required this.weight});
}

class _EditWeekWiseContentState extends State<EditWeekWiseContent> {

  TextEditingController monthController=TextEditingController();
  TextEditingController sizeController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController lengthController=TextEditingController();
  TextEditingController weightController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    monthController.text = widget.week.toString();
    sizeController.text = widget.size;
    descriptionController.text = widget.description;
    lengthController.text = widget.lenght;
    weightController.text = widget.weight;
    // imageName = widget.image;
  }

  XFile? image;
  final ImagePicker picker = ImagePicker();
  String imageName = 'Select Image';

  bool _isLoading = false;

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
            icon: Icon(Icons.arrow_back, color: Colors.white,),
          ),
          elevation: 0,
          title: Text(
            'Edit Week Wise Content',
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
              child: Text("Size",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: sizeController,
                decoration: InputDecoration(
                    hintText: 'Size',
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
              child: Text("Lenght (CM)",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: lengthController,
                decoration: InputDecoration(
                    hintText: 'Length',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
              ),
            ),

            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Weight (GRAM)",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: weightController,
                decoration: InputDecoration(
                    hintText: 'Weight',
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
                child: ElevatedButton(onPressed: () async{
                    setState(() {
                      _isLoading = true;
                    });
                    await EditWeekWiseContentApi.editWeekWiseContent(context,
                        monthController.text.trim(),
                        image!.path,
                        sizeController.text.trim(),
                        descriptionController.text.trim(),
                        lengthController.text.trim(),
                        weightController.text.trim(),
                        widget.id,
                    );
                    setState(() {
                      _isLoading = false;
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
