import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Widgets/custom_textfield.dart';
import '../Client-Dashboard/Api_services/add_menstruation_api.dart';
import '../Login/login_page.dart';
import 'register_api_service.dart';
import '../Utilities/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passwordVisible1 = false;
  bool passwordVisible2 = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController cnfPwdController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _pageViewController = PageController(initialPage: 0);

  List title = [
    'What should we call you?',
    'How do we contact you?',
    "Let's secure your account",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView.builder(
        physics: ScrollPhysics(),
        controller: _pageViewController,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/main.png'), fit: BoxFit.fill),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List<Widget>.generate(
                                3,
                                    (indicator) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 3),
                                  height: 10,
                                  width: indicator == index ? 30 : 10,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      color: indicator == index
                                          ? Colors.deepOrange
                                          : Colors.deepOrange.shade100),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              title[index],
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                          ),
                        ),
                        buildTextFields(index),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 49,
                              width: 130,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    print('object-------------------- ${fnameController.text}');
                                    if (index < 2) {
                                      _pageViewController.animateToPage(
                                          index + 1,
                                          duration:
                                          Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    } else if (index == 2) {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      await RegisterApi.registerUser(
                                        context,
                                        emailController.text.trim(),
                                        pwdController.text.trim(),
                                        mobileController.text.trim(),
                                        fnameController.text.trim(),
                                        lnameController.text.trim(),
                                        locationController.text.trim(),
                                      );
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: button,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(22.0)),
                                  ),
                                  child: _isLoading
                                      ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                      : Text("Next",
                                    style: GoogleFonts.headlandOne(
                                        fontSize: 17,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?",
                                style: GoogleFonts.headlandOne(fontSize: 15)),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.headlandOne(
                                      fontSize: 15,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
        itemCount: 3,
      ),
    );
  }

  Widget buildTextFields(int index) {
    return index == 0
        ? Column(
      children: [
        CustomTextField(
            controller: fnameController,
            hintText: 'First Name',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              return null;
            }),
        CustomTextField(
            controller: lnameController,
            hintText: 'Last Name',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              return null;
            }),
      ],
    )
        : index == 1
        ? Column(
      children: [
        CustomTextField(
            controller: emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            }),
        CustomTextField(
            controller: mobileController,
            hintText: 'Contact Number',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            }),
        CustomTextField(
            controller: locationController,
            hintText: 'Location',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              return null;
            }),
      ],
    ) : Column(
      children: [
        CustomTextField(
            controller: pwdController,
            hintText: "Create Password",
            obscureText: passwordVisible1,
            onSuffixIconPressed: () {
              setState(() {
                passwordVisible1 = !passwordVisible1;
              });
            },
            showSuffixIcon: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              return null;
            }),
        CustomTextField(
            controller: cnfPwdController,
            hintText: "Confirm Password",
            obscureText: passwordVisible2,
            onSuffixIconPressed: () {
              setState(() {
                passwordVisible2 = !passwordVisible2;
              });
            },
            showSuffixIcon: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              if (pwdController.text !=
                  cnfPwdController.text) {
                return 'Enter same password';
              }
              return null;
            }),
      ],
    );
  }
}
