
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_register/Api_services/register_api_service.dart';
import 'package:login_register/Utilities/colors.dart';

import '../Routes/route_names.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool passwordVisible1=false;

  TextEditingController emailController=TextEditingController();
  TextEditingController pwdController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController fnameController=TextEditingController();
  TextEditingController lnameController=TextEditingController();
  TextEditingController locationController=TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child:
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back),)

                ),
                const SizedBox(height: 27,),
                const Text("Sign up",style: TextStyle(fontSize: 39,fontWeight: FontWeight.bold,),),
                const SizedBox(height: 27,),
                const Text("Create an Account, Its free",style: TextStyle(fontSize: 15),),

                const SizedBox(height: 39,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,color: primary,),
                        hintText: "Email",
                        label: const Text('Email',),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29)
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: pwdController,
                    obscureText: passwordVisible1,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible1
                              ? Icons.visibility_off
                              : Icons.visibility,color: primary,),
                          onPressed: () {
                            setState(
                                  () {
                                passwordVisible1 = !passwordVisible1;
                              },
                            );
                          },
                        ),
                        prefixIcon: Icon(Icons.lock,color: primary,),
                        hintText: "Password",
                        label: const Text('Password',),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29)
                        ),
                    ),
                    keyboardType: TextInputType.emailAddress,

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (value.trim().length < 6) {
                        return 'Password must be at least 6 characters in length';
                      }
                      return null;
                    },

                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.date_range,color: primary,),
                        hintText: "Date",
                        label: const Text('Date',),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29)
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

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone,color: primary,),
                        hintText: "Contact Number",
                        label: const Text('Contact Number',),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29)
                        )
                    ),

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (value.length != 10) {
                        return 'Mobile Number must be of 10 digit';
                      }
                      return null;
                    },

                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: fnameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: primary,),
                        hintText: "First Name",
                        label: const Text('First Name',),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29)
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
                    controller: lnameController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: primary,),
                        hintText: "Last Name",
                        label: const Text('Last Name',),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29)
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
                    controller: locationController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.place,color: primary,),
                        hintText: "Location",
                        label: const Text('Location',),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29)
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

                ElevatedButton(onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    RegisterApi.registerUser(context,
                        emailController.text.trim(),
                        pwdController.text.trim(),
                        dateController.text.trim(),
                        mobileController.text.trim(),
                        fnameController.text.trim(),
                        lnameController.text.trim(),
                        locationController.text.trim());
                  }
                },
                    style: ElevatedButton.styleFrom(primary: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23.0)),),
                    child: const Text("Sign Up",style: TextStyle(fontSize: 17),)),

                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",style: TextStyle(fontSize: 16),),
                    TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, RouteName.login);
                        },
                        child: Text("Login",style: TextStyle(
                            fontSize: 16,color: button, fontWeight: FontWeight.bold),)
                    ),
                    const SizedBox(height: 50,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
