import 'package:flutter/material.dart';
import 'package:movie_app/Screens/login_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Shared component/customTextFormField.dart';


class Register  extends StatefulWidget {
  static String routeName = 'Register screen';
  Register ({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

   var nameController = TextEditingController();

   var passwordController = TextEditingController();

   bool isCheckbox = false;
   bool isCheckboxFalse = false;

   var formKey = GlobalKey<FormState>();
   void loginData(bool isRegister)async
   {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString("name", nameController.text);
     await prefs.setString("phone", phoneController.text);
     await prefs.setString("email", emailController.text);
     await prefs.setString("password", passwordController.text);
     await prefs.setBool("isRegister", isRegister);
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(29, 29, 29, 1.0),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50,top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Moive",style: Theme.of(context).textTheme.bodyMedium,),
                    Text("Club",style: Theme.of(context).textTheme.bodySmall,),
                  ],
                ),
              ),
              const Text("Create Account",style: TextStyle(
                fontSize: 20,
              ),),
              const SizedBox(height: 20,),
              const Text("Lets get started and create your\naccount",style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
          
              ),textAlign: TextAlign.center,),
              const SizedBox(height: 30,),
              Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextFormField(
                          controller:nameController,
                          hintText: "Name",
                          prefixIcon: Icons.person,
                          validatorText: "Name ",
                         keyboardType: TextInputType.text,
                          isPassword: false,
                        ),
                        CustomTextFormField(
                          controller:phoneController,
                          hintText: "Phone",
                          prefixIcon: Icons.phone,
                          validatorText: "Phone",
                         keyboardType: TextInputType.phone,
                          isPassword: false,
                        ),
                        CustomTextFormField(
                          controller:emailController,
                          hintText: "Email",
                          prefixIcon: Icons.email_outlined,
                          validatorText: "Email ",
                          keyboardType:  TextInputType.emailAddress,
                          isPassword: false,
                        ),
                        CustomTextFormField(
                          controller:passwordController,
                          hintText: "Password",
                          prefixIcon: Icons.lock_rounded,
                          validatorText: "Password",
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          isPassword: true,
                        ),
          
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Checkbox(
                               activeColor: const Color.fromRGBO(255, 187, 59, 50),
                                value: isCheckbox,
                                onChanged: (value){
                              setState(() {
                                isCheckbox = ! isCheckbox;
                              });
                                }),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yes,I understand and agree to the Movieclub",style: TextStyle(fontSize: 10,fontWeight:FontWeight.normal,color: Colors.grey)),
                                Row(
                                  children: [
                                    Text("Terms of Service, including the ",style: TextStyle(fontSize: 10,fontWeight:FontWeight.normal,color: Colors.grey)),
                                    Text("User Agreement ",style: TextStyle(color: Color.fromRGBO(255, 187, 59, 50),fontSize: 10)),

                                  ],
                                ),
                                Text("and Privacy Policy.",style: TextStyle(color: Color.fromRGBO(255, 187, 59, 50),fontSize: 10)),

                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 20,),
                            isCheckboxFalse ? Text("Please agree with our Privacy Policy",style:TextStyle(fontSize: 10,fontWeight:FontWeight.normal,color: Colors.grey[700],)):Text(""),

                        ],),
                         const SizedBox(height: 6,),
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 70),
                          child: MaterialButton(
                            onPressed: (){
                              if(isCheckbox == false)
                                {
                                  setState(() {
                                    isCheckboxFalse = true;
                                  });
                                }
                              else if(isCheckbox == true){
                                setState(() {
                                  isCheckboxFalse = false;
                                });
                              }
                              if(formKey.currentState!.validate() && isCheckbox == true)
                              {
                                 setState(() {
                                   loginData(true);
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                 });
                                  print("Login page");
                              }
                            },
                            minWidth: double.infinity,
                            color: const Color.fromRGBO(255, 187, 59, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                            child:  const Text("Sign Up",
                                style:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.normal)
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account ?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                )),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                            },
                                child: const Text("Sign in",
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 187, 59, 50),
                                      fontSize: 20,
                                      fontWeight:  FontWeight.bold
                                  ),)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
