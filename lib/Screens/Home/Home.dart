import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Screens/Home/custom_scroll.dart';
import 'package:provider/provider.dart';
import '../../provider/theme_provider.dart';
import 'home_builder.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "now_playing",
    "popular",
    "top_rated",
    "upcoming"
  ];

  @override
  Widget build(BuildContext context) {
    var theme =  Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child:  Column(
        children: [
         ListView.separated(
           scrollDirection: Axis.vertical,
             shrinkWrap: true,
             physics: const BouncingScrollPhysics(),
             itemBuilder: (context, int bigIndex) {
               return  Container(
                 margin: const EdgeInsets.all(20),
                 padding: const EdgeInsets.only(
                   left: 8,
                   right: 8
                 ),
                 decoration: BoxDecoration(
                   color: theme.isDarkMode? Colors.blueGrey[600]: Colors.grey[800],
                   boxShadow: const [
                     BoxShadow(blurRadius: 2, color: Colors.white)
                   ],
                 ),
                 child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           categories[bigIndex],
                           style:   Theme.of(context).textTheme.displayLarge,
                         ),
                         IconButton(
                           onPressed: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) =>
                                     CustomScroll(title: categories[bigIndex]),
                               ),
                             );
                           },
                           icon:  Icon(
                             Icons.arrow_forward,
                             size: 30,
                           ),
                         )
                       ],
                     ),
                     SizedBox(
                       height: 550.h,
                       child: ListView.builder(
                         shrinkWrap: true,
                         scrollDirection: Axis.horizontal,
                         physics: const BouncingScrollPhysics(),
                         itemBuilder: (context, index) => Row(
                           children: [
                             HomeBuilder(title: categories[bigIndex]),
                           ],
                         ),
                         itemCount: 4,
                       ),
                     ),
                   ],
                 ),
               );
             },
             separatorBuilder: (context, index) =>  SizedBox(height: 15.h),
             itemCount: 4),

           SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}