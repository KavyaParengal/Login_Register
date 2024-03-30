
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utilities/colors.dart';
import '../Api_services/edit_plan_list_api.dart';

class EditPricePlan extends StatefulWidget {
  final int id;
  final String paymentType;
  final int price;
  final String description;
  EditPricePlan({
    required this.id,
    required this.paymentType,
    required this.price,
    required this.description
  });

  @override
  State<EditPricePlan> createState() => _EditPricePlanState();
}

class _EditPricePlanState extends State<EditPricePlan> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
    print(widget.price);
    print(widget.paymentType);
    print(widget.description);

    priceController.text = widget.price.toString();
    titleController.text = widget.paymentType;
    descriptionController.text = widget.description;
  }

  TextEditingController priceController=TextEditingController();
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

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
            icon: Icon(Icons.arrow_back, color: Colors.white,),
          ),
          elevation: 0,
          title: Text(
            'Edit Premium Price',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Payment Type",style: TextStyle(
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
                  hintText: 'Payment Type',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
            ),
          ),

          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Amount",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                  hintText: 'Price',
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

          const SizedBox(height: 36,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(onPressed: () async{
                setState(() {
                  _isLoading = true;
                });
                await EditPremiumPriceApi.editPremiumPrice(
                    context,
                    titleController.text,
                    priceController.text,
                    descriptionController.text,
                    widget.id
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
    );
  }
}
