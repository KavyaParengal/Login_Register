
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/add_premium_content_api.dart';
import 'package:login_register/Admin-Dashboard/Api_services/add_free_video_api.dart';
import 'package:provider/provider.dart';

import '../../Client-Dashboard/Provider/plan_list_provider.dart';
import '../../Utilities/GenericDropdown.dart';
import '../../Utilities/colors.dart';

class AddPremiumContent extends StatefulWidget {
  const AddPremiumContent({super.key});

  @override
  State<AddPremiumContent> createState() => _AddPremiumContentState();
}

class _AddPremiumContentState extends State<AddPremiumContent> {

  TextEditingController videoController=TextEditingController();
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController monthController=TextEditingController();
  TextEditingController adviceController=TextEditingController();
  TextEditingController planController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String _option = '';
  String _selectedPlanId = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PlanListProvider>(context, listen: false).getPlanList();
    });
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
            'Add Premium Content',
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
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
                  keyboardType: TextInputType.number,
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
                child: TextFormField(
                  controller: adviceController,
                  decoration: InputDecoration(
                      hintText: "Advice",
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
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      await AddPremiumContentApi.addPremiumContent(context,
                          videoController.text.trim(),
                          titleController.text.trim(),
                          descriptionController.text,
                          monthController.text.trim(),
                          adviceController.text,
                          _selectedPlanId
                      );
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                      style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                      child: _isLoading ? CircularProgressIndicator(color: Colors.white,) : Text("Add",style: TextStyle(fontSize: 17, color: Colors.white),)),
                ),
              ),
              SizedBox(height: 300,)
            ],
          ),
        ),
      ),
    );
  }
}
