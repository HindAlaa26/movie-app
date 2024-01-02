import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Home/home_layout.dart';
import 'package:movie_app/Screens/Home/Home.dart';
import 'package:movie_app/Screens/login_screen.dart';
import 'package:movie_app/Screens/onboarding_screen.dart';
import 'package:movie_app/Screens/splash_screen.dart';
import 'package:movie_app/provider/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/register.dart';
Future<bool> getData()async
{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("isRegister")??false;
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await getData();
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider<FavoriteProvider>(
        create: (context) => FavoriteProvider(),
      ),

    ],
    child: MyApp(isLoggedIn:isLoggedIn),
  ));
}

class MyApp extends StatelessWidget {
  MyApp( {super.key, required this.isLoggedIn});
  bool  isLoggedIn;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode:ThemeMode.light,
      theme: ThemeData(
        textTheme:ThemeData.light().textTheme.copyWith(
          // onboarding screen text
          bodyLarge:const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            wordSpacing: 4,
            shadows:[ BoxShadow(blurRadius: 8,color: Colors.grey)],
            fontFamily: 'MochiyPopOne',
          ),
          // login screen text
          //movie
          bodyMedium:const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            wordSpacing: 4,
            color: Colors.white,
            fontFamily: 'MochiyPopOne',
          ),
          //club
          bodySmall: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            wordSpacing: 4,
            color: Color.fromRGBO(255, 187, 59, 1),
            fontFamily: 'MochiyPopOne',
          ),


        ),

      ),
      initialRoute: isLoggedIn? HomeLayout.routeName: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (_)=> const SplashScreen(),
        OnboardingScreen.routeName : (_)=> OnboardingScreen(),
        LoginScreen.routeName : (_)=> LoginScreen(),
        Register.routeName : (_)=> Register(),
        HomeScreen.routeName : (_)=>  HomeScreen(),
        HomeLayout.routeName : (_)=>  const HomeLayout(),
             },
    );
  }
}

