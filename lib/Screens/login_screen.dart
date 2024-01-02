import 'package:flutter/material.dart';
import 'package:movie_app/Screens/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Shared component/customTextFormField.dart';
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

  String? email;

  String? pass;

  void getData()async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString("email");
    pass = prefs.getString("password");
  }

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
                  Text("Moive",style: Theme.of(context).textTheme.bodyMedium,),
                  Text("Club",style: Theme.of(context).textTheme.bodySmall,),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            const Text("Welcome Back!",style: TextStyle(
              fontSize: 20,
            ),),
            const SizedBox(height: 20,),
            const Text("Please sign in to your account\nto continue",style: TextStyle(
              fontSize: 15,
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
                    const SizedBox(height: 20,),
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
                      child: MaterialButton(
                        onPressed: (){
                         setState(() {
                           getData();
                         });
                         if(formKey.currentState!.validate())
                         {
                           setState(() {

                             if(email == emailController.text && pass == passwordController.text)
                             {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeLayout(),));
                             }
                           });
                           print("home page");
                         }
                        },
                         minWidth: double.infinity,
                        color: const Color.fromRGBO(255, 187, 59, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                        child:  const Text("Sign in",
                            style:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.normal)
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not registered yet?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 20)),
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, Register.routeName);
                        }, child:const Text(" Sign Up",style: TextStyle(color: Color.fromRGBO(255, 187, 59, 1),fontWeight: FontWeight.normal,fontSize: 20)))
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
