
import 'package:flutter/material.dart';

import 'login_api_services.dart';
import '../Routes/route_names.dart';
import '../Utilities/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool passwordVisible1=false;
  bool passwordVisible2=false;

  TextEditingController emailController=TextEditingController();
  TextEditingController pwdController=TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login",style: TextStyle(fontSize: 39,fontWeight: FontWeight.bold,),),
              const SizedBox(height: 27,),
              const Text("Welcome back! Login with your Credentials",style: TextStyle(fontSize: 15),),

              const SizedBox(height: 39,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,color: primary,),
                      hintText: "Email ID",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                      ),
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

              const SizedBox(height: 36,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      LoginApi.loginUser(context, emailController.text.trim(), pwdController.text.trim());
                    }
                  },
                      style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                      child: const Text("Login",style: TextStyle(fontSize: 17, color: Colors.white),)),
                ),
              ),

              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",style: TextStyle(fontSize: 16),),
                  TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, RouteName.signUp);
                      },
                      child: Text("Sign Up",style: TextStyle(
                        fontSize: 16,color: button,fontWeight: FontWeight.bold),)
                  ),
                  const SizedBox(height: 50,)
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}
