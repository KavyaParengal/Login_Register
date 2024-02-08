import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Client-Dashboard/Utilities/colors.dart';

void main() {
  runApp(MaterialApp(
    home: DoctorSignUp(),
    debugShowCheckedModeBanner: false,
  ));
}

class DoctorSignUp extends StatefulWidget {
  @override
  State<DoctorSignUp> createState() => _DoctorSignUpState();
}

class _DoctorSignUpState extends State<DoctorSignUp> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool showpass = true;
  String? dropdownvalue;

  String? dropdownvalue1;
  String? dropdownvalue2;
  var items = [
    'Obstetician',
    'Pediatrition',
    'Psychiatrist',
    'Dietitian',
    'Psychologist'
  ];
  var items1 = ['Yes', 'No'];
  var items2 = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            const Text(
              "Doctor Signup",
              style: TextStyle(
                fontSize: 39,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Center(
                child: const Text(
              "Kindly spend some time to help us understand your better",
              style: TextStyle(fontSize: 15),
            )),
            SizedBox(
              height: 39,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "First Name",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      hintText: 'ex: Alexa',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 10),
                      prefixIcon: Icon(
                        Icons.person,
                        color: primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (fname) {
                    if (fname!.isEmpty) {
                      return "This field is Required";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Last name",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      hintText: 'ex:Alexa',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 10),
                      prefixIcon: Icon(
                        Icons.person,
                        color: primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (lname) {
                    if (lname!.isEmpty) {
                      return "This field is required";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Age",
                      hintText: 'ex:25',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 10),
                      prefixIcon: Icon(
                        Icons.person,
                        color: primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (age) {
                    if (age!.isEmpty || age!.length < 2) {
                      return "Enter your Age";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //       keyboardType: TextInputType.name,
            //       decoration: InputDecoration(
            //           labelText: 'Speciality',
            //           labelStyle: TextStyle(
            //               color: Colors.black, fontSize: 14, fontFamily: 'Avenir'),
            //           prefixIcon: Icon(
            //             Icons.local_hospital,
            //             color: primary,
            //           ),
            //           border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(12))),
            //       validator: (speciality) {
            //         if (speciality!.isEmpty) {
            //           return "This field is required";
            //         } else {
            //           return null;
            //         }
            //       }),
            // ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Speciality',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Avenir'),
                    prefixIcon: Icon(
                      Icons.folder_special_rounded,
                      color: primary,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    // Return null if the entered username is valid
                    return null;
                  },
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Qualification',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      prefixIcon: Icon(
                        Icons.school,
                        color: primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (qualifications) {
                    if (qualifications!.isEmpty) {
                      return "This field is required";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //       keyboardType: TextInputType.name,
            //       decoration: InputDecoration(
            //           labelText: 'Medical Council Registered',
            //           labelStyle: TextStyle(
            //               color: Colors.black, fontSize: 14, fontFamily: 'Avenir'),
            //           prefixIcon: Icon(
            //             Icons.school,
            //             color: primary,
            //           ),
            //           border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(12))),
            //       validator: (medical) {
            //         if (medical!.isEmpty) {
            //           return "This field is required";
            //         } else {
            //           return null;
            //         }
            //       }),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Medical Council Registered?',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Avenir'),
                    prefixIcon: Icon(
                      Icons.folder_special_rounded,
                      color: primary,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (values) {
                    if (values == null || values.trim().isEmpty) {
                      return 'This field is required';
                    }
                    // Return null if the entered username is valid
                    return null;
                  },
                  value: dropdownvalue1,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items1.map((String items1) {
                    return DropdownMenuItem(
                      value: items1,
                      child: Text(items1),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue1 = newValue!;
                    });
                  },
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Council Reg No',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      prefixIcon: Icon(
                        Icons.app_registration_outlined,
                        color: primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (registration) {
                    if (registration!.isEmpty || registration!.length < 10) {
                      return "This field is required";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Experience',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      prefixIcon: Icon(
                        Icons.expand,
                        color: primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (experience) {
                    if (experience!.isEmpty) {
                      return "This field is required";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Interest',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      prefixIcon: Icon(
                        Icons.interests,
                        color: primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (interest) {
                    if (interest!.isEmpty) {
                      return "This field is required";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Referral Id',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      hintText: 'ex:123',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 10),
                      prefixIcon: Icon(
                        Icons.numbers,
                        color: primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (id) {
                    if (id!.isEmpty || id!.length < 10) {
                      return "This Field is required";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Hospitals',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      prefixIcon: Icon(
                        Icons.local_hospital,
                        color: primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (hspitals) {
                    if (hspitals!.isEmpty ||
                        hspitals.contains("#") ||
                        hspitals.contains("/")) {
                      return "This Field is required";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Place Of Work',
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      prefixIcon: Icon(
                        Icons.place,
                        color: primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (place) {
                    if (place!.isEmpty) {
                      return "This Field is required";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText:
                        'Are you willing to do Online Consultation for your Patient?',
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Avenir'),
                    prefixIcon: Icon(
                      Icons.online_prediction,
                      color: primary,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value1) {
                    if (value1 == null || value1.trim().isEmpty) {
                      return 'This field is required';
                    }
                    // Return null if the entered username is valid
                    return null;
                  },
                  value: dropdownvalue2,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items2.map((String items2) {
                    return DropdownMenuItem(
                      value: items2,
                      child: Text(items2),
                    );
                  }).toList(),
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownvalue2 = newValue2!;
                    });
                  },
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextFormField(
            //       keyboardType: TextInputType.name,
            //       decoration: InputDecoration(
            //           labelText: 'Online Consultation',
            //           labelStyle: TextStyle(
            //               color: Colors.black, fontSize: 14, fontFamily: 'Avenir'),
            //           prefixIcon: Icon(
            //             Icons.online_prediction,
            //             color: primary,
            //           ),
            //           border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(12))),
            //       validator: (online) {
            //         if (online!.isEmpty) {
            //           return "This field is required";
            //         } else {
            //           return null;
            //         }
            //       }),
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      hintText: 'ex:alexa@gmail.com',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 10),
                      prefixIcon: Icon(
                        Icons.email,
                        color: primary,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (email) {
                    if (email!.isEmpty || email!.contains("/")) {
                      return "Enter your  email";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  obscureText: showpass,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      hintText: 'ex:xxx',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 10),
                      prefixIcon: Icon(
                        Icons.password,
                        color: primary,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (showpass) {
                              showpass = false;
                            } else {
                              showpass = true;
                            }
                          });
                        },
                        icon: Icon(showpass == true
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (pass1) {
                    if (pass1!.isEmpty || pass1!.length < 6) {
                      return "Enter password";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Avenir'),
                      hintText: 'ex:xxx',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 10),
                      prefixIcon: Icon(
                        Icons.password,
                        color: primary,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (showpass) {
                              showpass = false;
                            } else {
                              showpass = true;
                            }
                          });
                        },
                        icon: Icon(showpass == true
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  validator: (pass2) {
                    if (pass2!.isEmpty || pass2!.length < 6) {
                      return "Confirm password";
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 39,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: button,
                      fixedSize: const Size(300, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                    onPressed: () {
                      // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 16,
                          color: button,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
