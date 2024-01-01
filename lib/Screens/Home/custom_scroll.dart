import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Home/home_builder.dart';

class CustomScroll extends StatelessWidget {
  String title;
   CustomScroll({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,bottom: 20),
            child: Row(

              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                    icon: const Icon(Icons.arrow_back,size: 30,)),
                const SizedBox(width: 25,),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
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
