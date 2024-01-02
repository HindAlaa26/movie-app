import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Screens/Home/custom_scroll.dart';
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
                 padding: const EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   color: Colors.grey[800],
                   boxShadow: const [
                     BoxShadow(blurRadius: 3, color: Colors.white)
                   ],
                 ),
                 child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           categories[bigIndex],
                           style:  TextStyle(
                               color: Colors.white, fontSize: 23.sp),
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
                           icon:  const Icon(
                             Icons.arrow_forward,
                             color: Colors.orange,
                             size: 30,
                           ),
                         )
                       ],
                     ),
                     SizedBox(
                       height: 560.h,
                       width: double.infinity,
                       child: ListView.builder(
                         shrinkWrap: true,
                         scrollDirection: Axis.horizontal,
                         physics: const BouncingScrollPhysics(),
                         itemBuilder: (context, index) => GestureDetector(
                           onTap: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) =>
                                     CustomScroll(title: categories[bigIndex]),
                               ),
                             );
                           },
                           child: Row(
                             children: [
                               HomeBuilder(title: categories[bigIndex]),
                             ],
                           ),
                         ),

                         itemCount: 4,
                       ),
                     ),
                   ],
                 ),
               );
             },
             separatorBuilder: (context, index) =>  SizedBox(height: 18.h),
             itemCount: 4),

           SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}