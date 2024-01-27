import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Screens/Home/custom_scroll.dart';
import '../../provider/theme_provider.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<String> categories = ["now_playing", "popular", "top_rated", "upcoming"];
  bool isSwitched = false;
  void setLoginState(bool isRegister) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // to save email and pass
    // prefs.remove("isRegister");
    // to clear all
    //prefs.clear();
    await prefs.setBool("isRegister", isRegister);
  }

  bool isSwitch = true;
  @override
  Widget build(BuildContext context) {
    var themeProvide = Provider.of<ThemeProvider>(context, listen: true);
    return Drawer(
      child: Column(
        children: [
          Image(
              image: const NetworkImage(
                "https://img.freepik.com/free-photo/3d-rat-watching-movie-cinema_23-2151024865.jpg?size=626&ext=jpg&ga=GA1.1.2114304355.1700854564&semt=sph",
              ),
              height: 343.h,
              width: double.infinity,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                  );
                }
              }),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomScroll(
                                      title: categories[index],
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 12,top: 3,left: 12,right: 12
                        ),
                        padding: const EdgeInsets.all(15),
                        color: Theme.of(context).hoverColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              categories[index],
                              style:
                                  Theme.of(context).textTheme.displayLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 3.h),
                itemCount: categories.length),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dark", style: Theme.of(context).textTheme.labelSmall),
              SizedBox(
                width: 5,
              ),
                   Switch(
                     value: themeProvide.isDarkMode,
                     onChanged: (value) {
                         themeProvide.changeAppMode();
                     },
                     inactiveThumbColor: Colors.orange,
                     inactiveTrackColor: Colors.black87,
                     activeColor: Colors.blueGrey[100],
                     activeTrackColor: Colors.blueGrey,
                   ),

              SizedBox(
                width: 5,
              ),
              Text(
                "Light",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: ListTile(
              leading: const Icon(Icons.logout_outlined,
                  color: Colors.grey, size: 35),
              title: Text(
                "Logout",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              onTap: () {
                setLoginState(false);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
        ],
      ),
    );
  }
}
