import 'package:flutter/material.dart';
import 'package:movie_app/Screens/login_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/Home/custom_scroll.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<String> categories=[
    "now_playing",
    "popular",
    "top_rated",
    "upcoming"
  ];
  void removeData()async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // to save email and pass
   // prefs.remove("isRegister");
    // to clear all
     prefs.clear();
  }
 bool isSwitch = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        color: const Color.fromRGBO(29, 29, 29, 1.0),
        child: Column(
          children: [
            Image(image: const NetworkImage("https://img.freepik.com/free-photo/3d-rat-watching-movie-cinema_23-2151024865.jpg?size=626&ext=jpg&ga=GA1.1.2114304355.1700854564&semt=sph",),
           height: 350,
           width: double.infinity,
           fit: BoxFit.fill,
               errorBuilder: (context, error, stackTrace) =>  const Icon(Icons.error),
               loadingBuilder: (context, child, loadingProgress){
                 if(loadingProgress == null)
                 {
                   return child;
                 }
                 else{
                   return const SizedBox(
                     height: 100,
                     width: 100,
                     child: Center(
                       child: CircularProgressIndicator(color: Colors.orange,),
                     ),
                   );
                 }
               }
           ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>  CustomScroll(title: categories[index],)));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey[800],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(categories[index],style: const TextStyle(color: Colors.white,fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(height: 5),
                  itemCount: categories.length),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: ListTile(
                leading: const Icon( Icons.logout_outlined,color: Colors.grey,size: 30),
                title: const Text("Logout",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.normal)),
                onTap: (){
                  removeData();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

