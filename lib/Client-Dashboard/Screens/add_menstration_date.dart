
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Api_services/add_menstruation_api.dart';
import '../../Utilities/colors.dart';

class AddMenstrationDate extends StatefulWidget {
  const AddMenstrationDate({super.key});

  @override
  State<AddMenstrationDate> createState() => _AddMenstrationDateState();
}

class _AddMenstrationDateState extends State<AddMenstrationDate> {

  TextEditingController dateController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/main.png'), fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select the last menstruation date?",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.date_range,color: primary,),
                          hintText: "Menstruation Date",
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
                      onTap: () async {
                        DateTime? pickedDate= await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            dateController.text = formattedDate;
                          });
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 49,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.teal.shade200,
                                offset: Offset(3, 6),
                                blurRadius: 6,
                                spreadRadius: 1
                            )
                          ]
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            await AddMenstruationDateApi.addMenstruationDate(context, dateController.text.trim());
                            setState(() {
                              _isLoading = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: button, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),),
                          child: _isLoading ? CircularProgressIndicator(color: Colors.white,) :
                          Text("Add",style: GoogleFonts.headlandOne(fontSize: 17, color: Colors.white),)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
