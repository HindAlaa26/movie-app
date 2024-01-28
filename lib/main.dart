import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Screens/Home/home_layout.dart';
import 'package:movie_app/Screens/Home/Home.dart';
import 'package:movie_app/Screens/login_screen.dart';
import 'package:movie_app/Screens/onboarding_screen.dart';
import 'package:movie_app/Screens/splash_screen.dart';
import 'package:movie_app/provider/favorite_provider.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'Screens/favorite.dart';
import 'Screens/register.dart';
import 'Shared/local/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  bool isLoggedIn = await SharedPreferencesHelper.getRegisterState();
  bool isDark = await ThemeProvider.getIsDarkData() ;

  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider<FavoriteProvider>(
        create: (context) => FavoriteProvider(),
      ),
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
        lazy: false,
      ),

    ],
    child: Builder(
      builder: (context) {
        // Retrieve the themeProvider instance
        final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          themeProvider.changeAppMode(fromShared: isDark);
        });
        return MyApp(isLoggedIn: isLoggedIn, isDark: isDark);
      },
    ),
  )
  );
}

class MyApp extends StatelessWidget {
  MyApp( {super.key, required this.isLoggedIn,required this.isDark});
  bool  isLoggedIn;
 final bool isDark;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(390, 812), // Provide your design size
    );

    final themeProvider = Provider.of<ThemeProvider>(context);
    return  MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode:themeProvider.isDarkMode? ThemeMode.light :ThemeMode.dark ,
          darkTheme: ThemeData(
              textTheme:ThemeData.dark().textTheme.copyWith(
                //favorite text
                  titleLarge: TextStyle(color: Colors.orange, fontSize: 25.sp),
                  // OnBoarding screen text
                  bodyLarge: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 4,
                    shadows:const [ BoxShadow(blurRadius: 8,color: Colors.grey)],
                    fontFamily: 'MochiyPopOne',
                  ),
                  // login screen text
                  //movie
                  bodyMedium: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 4,
                    color: Colors.white,
                    fontFamily: 'MochiyPopOne',
                  ),
                  //club
                  bodySmall:  TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 4,
                    color: const Color.fromRGBO(255, 187, 59, 1),
                    fontFamily: 'MochiyPopOne',
                  ),
                  //menu category name text
                  displayLarge: TextStyle(color: Colors.white,fontSize:23.sp,fontWeight: FontWeight.bold),
                  //logout text
                  displayMedium: TextStyle(color: Colors.grey,fontSize: 20.sp,),
                  //vote rate average and title
                  titleMedium: TextStyle(fontSize: 25.sp,decoration: TextDecoration.none,color: Colors.white,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                  //movie Date
                  labelMedium: TextStyle(fontSize: 23.sp,decoration: TextDecoration.none,color: Colors.grey[800],fontWeight: FontWeight.bold),
                  // Overview , Release Date,Movie Name and Release Date in item details
                  labelLarge: TextStyle(color: Colors.orange,fontSize: 24.sp,decoration: TextDecoration.none),
                  //Overview , Release Date,Movie Name and in item details value
                  displaySmall: TextStyle(color: Colors.white,fontSize: 20.sp,decoration: TextDecoration.none,overflow: TextOverflow.ellipsis),
                  //release date
                  titleSmall: TextStyle(color: Colors.grey,fontSize: 18.sp,decoration: TextDecoration.none),
                  // dark and light text in menu
                  labelSmall: TextStyle(color: Colors.grey[500],fontSize: 25.sp,fontWeight: FontWeight.bold)
              ),
              iconTheme: IconThemeData(
                  color: Colors.grey
              ),
              primaryColor: Colors.grey[800],
              hoverColor: const Color.fromRGBO(112, 112, 112, 100),
              indicatorColor: Colors.orange,
              // Default color for IconButton widgets in the app
              iconButtonTheme: IconButtonThemeData(
                style:ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.orange), // Default color for IconButton widgets in the app
                ),
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: const Color.fromRGBO(29, 29, 29, 50),
                elevation: 0,
                iconTheme: const IconThemeData(color: Color.fromRGBO(255, 187, 59, 1)),
              ),
              drawerTheme: DrawerThemeData(
                backgroundColor:const Color.fromRGBO(29, 29, 29, 1.0),
              ),
              scaffoldBackgroundColor: const Color.fromRGBO(29, 29, 29, 50),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor:const Color.fromRGBO(26, 26, 26,1) ,
                selectedItemColor:const Color.fromRGBO(255, 187, 59, 1) ,
                unselectedItemColor: Colors.white,
              )

          ),
          theme: ThemeData(
              textTheme:ThemeData.dark().textTheme.copyWith(
                //favorite text
                  titleLarge: TextStyle(color: Colors.grey, fontSize: 25.sp),
                  // onboarding screen text
                  bodyLarge: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 4,
                    shadows:const [ BoxShadow(blurRadius: 8,color: Colors.grey)],
                    fontFamily: 'MochiyPopOne',
                  ),
                  // login screen text
                  //movie
                  bodyMedium: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 4,
                    color: Colors.blueGrey,
                    fontFamily: 'MochiyPopOne',
                  ),
                  //club
                  bodySmall:  TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 4,
                    color: Colors.blueGrey[400],
                    fontFamily: 'MochiyPopOne',
                  ),
                  //menu category name text
                  displayLarge: TextStyle(color: Colors.grey[300],fontSize:23.sp,fontWeight: FontWeight.bold),
                  //logout text
                  displayMedium: TextStyle(color: Colors.grey,fontSize: 20.sp,),
                  //vote rate average and title in home
                  titleMedium: TextStyle(fontSize: 25.sp,decoration: TextDecoration.none,color: Colors.blueGrey[100],fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                  //movie Date in home and favorite
                  labelMedium: TextStyle(fontSize: 23.sp,decoration: TextDecoration.none,color: Colors.grey[400],fontWeight: FontWeight.bold),
                  // Overview , Release Date,Movie Name and Release Date in item details
                  labelLarge: TextStyle(color: Colors.blueAccent[800],fontSize: 24.sp,decoration: TextDecoration.none),
                  //Overview , Release Date,Movie Name and in item details value
                  displaySmall: TextStyle(color: Colors.grey[400],fontSize: 20.sp,decoration: TextDecoration.none,overflow: TextOverflow.ellipsis),
                  //release date in item details value
                  titleSmall: TextStyle(color: Colors.grey,fontSize: 18.sp,decoration: TextDecoration.none),
                  // dark and light text
                  labelSmall: TextStyle(color: Colors.blueGrey[600],fontSize: 25.sp,fontWeight: FontWeight.bold)
              ),

              iconButtonTheme: IconButtonThemeData(
                style:   ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey[100]!), // Default color for IconButton widgets in the app
                ),// Default color for IconButton widgets in the app
              ),
              primaryColor: Colors.blueGrey[600],
              hoverColor: Colors.blueGrey[700],
              indicatorColor: Colors.blueGrey[700],
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.blueGrey[800],
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.blueGrey),
              ),

              drawerTheme: DrawerThemeData(
                backgroundColor: Colors.blueGrey[900],
              ),
              scaffoldBackgroundColor: Colors.blueGrey[800],
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor:Colors.blueGrey[700],
                selectedItemColor:Colors.blueGrey[300] ,
                unselectedItemColor: Colors.grey[300],

              )

          ),
          initialRoute: isLoggedIn? HomeLayout.routeName: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName : (_)=> const SplashScreen(),
            OnBoardingScreen.routeName : (_)=> OnBoardingScreen(),
            LoginScreen.routeName : (_)=> LoginScreen(),
            Register.routeName : (_)=> Register(),
            HomeScreen.routeName : (_)=>  HomeScreen(),
            HomeLayout.routeName : (_)=>  const HomeLayout(),
            Favorite.routeName : (_)=>  const Favorite(),
          },
        );

  }
}

