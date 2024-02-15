
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_register/Admin-Dashboard/Api_services/edit_banner_api.dart';
import 'package:path/path.dart';

import '../../Utilities/colors.dart';

class EditBanners extends StatefulWidget {

  final int id;
  final String banner;
  final int order;

  @override
  State<EditBanners> createState() => _EditBannersState();

  EditBanners({
    required this.id,
    required this.banner,
    required this.order});
}

class _EditBannersState extends State<EditBanners> {

  TextEditingController orderController=TextEditingController();

  XFile? image;
  final ImagePicker picker = ImagePicker();
  String imageName = 'Select Image';

  @override
  void initState() {
    super.initState();
    orderController.text = widget.order.toString();
  }

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
            'Edit Banners',
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
            child: Text("Order",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: orderController,
              decoration: InputDecoration(
                  hintText: "Order",
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
            child: Text("Banner Image",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800
            ),),
          ),
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
          const SizedBox(height: 36,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: (){
                      EditBannerAPI.editBanner(context, orderController.text, image!.path, widget.id);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                  child: const Text("Edit",style: TextStyle(fontSize: 17, color: Colors.white),)),
            ),
          ),
        ],
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
