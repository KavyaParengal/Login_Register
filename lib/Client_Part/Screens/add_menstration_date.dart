
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Api_services/add_menstruation_api.dart';
import '../Utilities/colors.dart';

class AddMenstrationDate extends StatefulWidget {
  const AddMenstrationDate({super.key});

  @override
  State<AddMenstrationDate> createState() => _AddMenstrationDateState();
}

class _AddMenstrationDateState extends State<AddMenstrationDate> {

  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          const SizedBox(height: 36,),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(onPressed: (){
                AddMenstruationDateApi.addMenstruationDate(context, dateController.text.trim());
              },
                  style: ElevatedButton.styleFrom(primary: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                  child: const Text("Add",style: TextStyle(fontSize: 17),)),
            ),
          ),
        ],
      ),
    );
  }
}
