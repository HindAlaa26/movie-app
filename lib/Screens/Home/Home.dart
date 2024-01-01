import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Home/custom_scroll.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
List<String> categories=[
  "now_playing",
  "popular",
  "top_rated",
  "upcoming"
];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100,),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>  CustomScroll(title: categories[index],)));
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      boxShadow: const [BoxShadow(blurRadius: 3,color: Colors.white)]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(categories[index],style: const TextStyle(color: Colors.white,fontSize: 20),),
                      IconButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(
                            builder: (context) =>  CustomScroll(title: categories[index],)));
                      }, icon: const Icon(Icons.arrow_forward,color: Colors.orange,size: 30,))
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: categories.length),
        )
      ],
    );
  }
}