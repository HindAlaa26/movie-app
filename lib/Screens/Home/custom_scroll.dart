import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Screens/Home/home_builder.dart';

class CustomScroll extends StatelessWidget {
  String title;
   CustomScroll({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                    icon:  Icon(Icons.arrow_back,size: 30,color: Theme.of(context).primaryColor)),
                 SizedBox(width: 25.w,),
                Text(
                  title,
                  style:  TextStyle(
                      color: Colors.grey,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none
                  ),
                ),
              ],
            ),
          ),
          HomeBuilder(title: title,)
        ],
      ),
    );
  }
}
