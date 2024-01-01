import 'package:flutter/material.dart';
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
            const Image(image: AssetImage("assets/images/logo.png"),height: 200,),
            const SizedBox(height: 150,),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, OnboardingScreen.routeName);
              },
              child:  const Text("Let's Start",
                  style: TextStyle(color: Color.fromRGBO(255, 187, 59, 50),fontSize: 30,
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
