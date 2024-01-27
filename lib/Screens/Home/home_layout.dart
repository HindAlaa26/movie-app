import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Screens/Home/Home.dart';
import 'package:movie_app/Screens/favorite.dart';
import '../../Shared/shared_component/home_drawer.dart';

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
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Moive",style: Theme.of(context).textTheme.bodyMedium,),
             SizedBox(width: 5.w,),
             Text("Club",style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
      ),
      drawer: const HomeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "HOME",),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "FAVORITE",
          activeIcon:Icon(Icons.favorite) ),
        ],
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
