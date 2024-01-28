import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Screens/register.dart';
import 'package:movie_app/Shared/local/shared_preferences.dart';
import '../Shared/shared_component/customTextFormField.dart';
import 'Home/home_layout.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'login screen';
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
   List<String>? emailAndPasswordList;
   bool loadingButton = false;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
       color: const Color.fromRGBO(29, 29, 29, 1.0),
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Moive",style:TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 4,
                    color: Colors.white,
                    fontFamily: 'MochiyPopOne',
                  )),
                  Text("Club",style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 4,
                    color: const Color.fromRGBO(255, 187, 59, 1),
                    fontFamily: 'MochiyPopOne',
                  ),),
                ],
              ),
            ),
             SizedBox(height: 40.h,),
             Text("Welcome Back!",style: TextStyle(
              fontSize: 18.sp,
               color: Colors.white
            ),),
             SizedBox(height: 18.h,),
             Text("Please sign in to your account\nto continue",style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey,

            ),textAlign: TextAlign.center,),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validatorText: "Email",
                      hintText: "Email",
                      prefixIcon: Icons.email_outlined,
                      isPassword: false,
                    ),
                     SizedBox(height: 18.h,),
                    CustomTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      prefixIcon: Icons.lock_outline_rounded,
                      validatorText: "Password",
                      hintText: "Password",
                      obscureText: isPassword,
                      isPassword: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60,left: 70,right: 70),
                      child:loadingButton ? CircularProgressIndicator(color:Colors.orange,) : MaterialButton(
                        onPressed: ()async{

                           SharedPreferencesHelper.setLoginState(true);
                           emailAndPasswordList = await SharedPreferencesHelper.getEmailAndPassword();

                         if(formKey.currentState!.validate())
                         {
                           for (String pair in emailAndPasswordList!) {
                             List<String> splitPair = pair.split(':');
                             if (splitPair[0] == emailController.text && splitPair[1] == passwordController.text) {
                               setState(() {
                                 loadingButton = true;
                               });
                               Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeLayout(),));
                               print("home page");
                             }
                           }
                         }
                        },
                         minWidth: double.infinity,
                        color: const Color.fromRGBO(255, 187, 59, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                        child:   Text("Sign in",
                            style:TextStyle(color: Colors.white,fontSize: 23.sp,fontWeight: FontWeight.w500)
                        ),
                      ),
                    ),
                     SizedBox(height: 48.h,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("Not registered yet?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 18.sp)),
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, Register.routeName);
                        }, child: Text(" Sign Up",style: TextStyle(color: const Color.fromRGBO(255, 187, 59, 1),fontWeight: FontWeight.normal,fontSize: 18.sp)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
