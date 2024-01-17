import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
   void loginData(
       {required bool isRegister,
         required String email,
         required String password}
       )async
   {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     // Get the existing list of email and password pairs from shared preferences
     List<String> emailAndPasswordList = prefs.getStringList('emailAndPasswordList') ?? [];

     // Add the new email and password pair to the list
     emailAndPasswordList.add('$email:$password');

     // Save the updated list back to shared preferences
     await prefs.setStringList('emailAndPasswordList', emailAndPasswordList);
     await prefs.setString("name", nameController.text);
     await prefs.setString("phone", phoneController.text);
     await prefs.setBool("isRegister", isRegister);
     print(emailAndPasswordList);
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
               Text("Create Account",style: TextStyle(
                fontSize: 18.sp,
              ),),
               SizedBox(height: 18.h,),
               Text("Lets get started and create your\naccount",style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey,
          
              ),textAlign: TextAlign.center,),
               SizedBox(height: 28.h,),
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
                        SizedBox(height: 5.h,),
                        CustomTextFormField(
                          controller:phoneController,
                          hintText: "Phone",
                          prefixIcon: Icons.phone,
                          validatorText: "Phone",
                         keyboardType: TextInputType.phone,
                          isPassword: false,
                        ),
                        SizedBox(height: 5.h,),
                        CustomTextFormField(
                          controller:emailController,
                          hintText: "Email",
                          prefixIcon: Icons.email_outlined,
                          validatorText: "Email ",
                          keyboardType:  TextInputType.emailAddress,
                          isPassword: false,
                        ),
                        SizedBox(height: 5.h,),
                        CustomTextFormField(
                          controller:passwordController,
                          hintText: "Password",
                          prefixIcon: Icons.lock_rounded,
                          validatorText: "Password",
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          isPassword: true,
                        ),
          
                         SizedBox(height: 18.h,),
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
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yes,I understand and agree to the Movieclub",style: TextStyle(fontSize: 10.sp,fontWeight:FontWeight.normal,color: Colors.grey)),
                                Row(
                                  children: [
                                    Text("Terms of Service, including the ",style: TextStyle(fontSize: 10.sp,fontWeight:FontWeight.normal,color: Colors.grey)),
                                    Text("User Agreement ",style: TextStyle(color: const Color.fromRGBO(255, 187, 59, 50),fontSize: 10.sp)),

                                  ],
                                ),
                                Text("and Privacy Policy.",style: TextStyle(color: const Color.fromRGBO(255, 187, 59, 50),fontSize: 10.sp)),

                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                             SizedBox(width: 18.w,),
                            isCheckboxFalse ? Text("Please agree with our Privacy Policy",style:TextStyle(fontSize: 13.sp,fontWeight:FontWeight.normal,color: Colors.grey[700],)):const Text(""),

                        ],),
                          SizedBox(height: 8.h,),
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
                                   loginData(isRegister: true, email:emailController.text, password: passwordController.text);
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                 });
                              }
                            },
                            minWidth: double.infinity,
                            color: const Color.fromRGBO(255, 187, 59, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                            child:   Text("Sign Up",
                                style:TextStyle(color: Colors.white,fontSize: 23.sp,fontWeight: FontWeight.w500)
                            ),
                          ),
                        ),
                         SizedBox(height: 18.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text("Don't have an account ?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold
                                )),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                            },
                                child:  Text("Sign in",
                                  style: TextStyle(
                                      color: const Color.fromRGBO(255, 187, 59, 50),
                                      fontSize: 18.sp,
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
