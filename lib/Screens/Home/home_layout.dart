import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Screens/Home/Home.dart';
import 'package:movie_app/Screens/favorite.dart';
import 'package:movie_app/Shared%20component/home_drawer.dart';

class HomeLayout extends StatefulWidget {
  static String routeName = 'home screen';
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

List<Widget> screens = [
  HomeScreen(),
  const Favorite()
];
int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(29, 29, 29, 50),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color.fromRGBO(255, 187, 59, 1)),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Moive",style: Theme.of(context).textTheme.bodyMedium,),
             SizedBox(width: 5.w,),
             Text("Club",style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              wordSpacing: 5,
              color: const Color.fromRGBO(255, 187, 59, 1),
              fontFamily: 'MochiyPopOne',
            ),),
          ],
        ),
      ),
      drawer: const HomeDrawer(),
      backgroundColor: const Color.fromRGBO(29, 29, 29, 50),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:const Color.fromRGBO(26, 26, 26,1) ,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "HOME",),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "FAVORITE",
          activeIcon:Icon(Icons.favorite) ),
        ],
        selectedItemColor:const Color.fromRGBO(255, 187, 59, 1) ,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (value)
        {
         setState(() {
           currentIndex = value;
         });
         print(value);
        },
      ),


      body:screens[currentIndex],
    );
  }
}
