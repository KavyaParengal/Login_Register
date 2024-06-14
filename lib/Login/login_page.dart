
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Register/sign_up_page.dart';
import 'package:login_register/Widgets/custom_textfield.dart';

import 'login_api_services.dart';
import '../Utilities/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool passwordVisible1=false;
  bool passwordVisible2=false;
  bool _isLoading = false;

  TextEditingController emailController=TextEditingController();
  TextEditingController pwdController=TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/main.png'), fit: BoxFit.fill),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: const Text("Login",style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold,),),
                    ),
                    CustomTextField(
                        controller: emailController,
                        hintText: 'Email'
                    ),
                    CustomTextField(
                      controller: pwdController,
                      hintText: "Password",
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
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 49,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                                await LoginApi.loginUser(context, emailController.text.trim(), pwdController.text.trim());
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: button, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),),
                            child: _isLoading ? CircularProgressIndicator(color: Colors.white,) :
                            Text("Login",style: GoogleFonts.headlandOne(fontSize: 17, color: Colors.white),)),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",style: GoogleFonts.headlandOne(fontSize: 15),),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                            },
                            child: Text("Sign Up Now",style: GoogleFonts.headlandOne(
                                fontSize: 15,color: Colors.deepOrange,fontWeight: FontWeight.bold),)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
