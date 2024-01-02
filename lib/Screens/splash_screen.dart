import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'Splash Screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image(image: const AssetImage("assets/images/logo.png"),height: 200.h,),
             SizedBox(height: 150.h,),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, OnboardingScreen.routeName);
              },
              child:   Text("Let's Start",
                  style: TextStyle(color: const Color.fromRGBO(255, 187, 59, 50),fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MochiyPopOne'
                  )),
            )
          ],
        ),
      ),
    );
  }
}
