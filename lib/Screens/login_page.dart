
import 'package:flutter/material.dart';
import 'package:login_register/Api_services/login_api_services.dart';
import 'package:login_register/Routes/route_names.dart';
import 'package:login_register/Utilities/colors.dart';

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
                        label: const Text('Email ID',),
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
                        )
                    ),

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

                const SizedBox(height: 36,),

                ElevatedButton(onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    LoginApi.loginUser(context, emailController.text.trim(), pwdController.text.trim());
                  }
                },
                    style: ElevatedButton.styleFrom(primary: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23.0)),),
                    child: const Text("Login",style: TextStyle(fontSize: 17),)),

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

      ),
    );
  }
}
