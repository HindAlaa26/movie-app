import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Screens/login_screen.dart';

import '../Shared component/page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
   static String routeName = 'Onboarding';
   OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> onboardingText = ["Welcome to Movie Club, let's start movie time",
    "login to movie club", "choose a movie","watch movie"];

  List<String> onboardingImage = ["assets/images/onboarding_screen/welcome_movie.png",
  "https://cdni.iconscout.com/illustration/premium/thumb/login-page-2578971-2147152.png",
  "assets/images/onboarding_screen/choose movie.png",
    "assets/images/onboarding_screen/watch movie.png"];

   int currentIndex = 0;

   int currentPosition = 0 ;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (value){
             setState(() {
               currentIndex = value;

             });
            },
            children: [
              Container(
                color: Colors.black87,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150,bottom: 50),
                      child: Image(image: AssetImage(onboardingImage[0])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(onboardingText[0],
                          style: Theme.of(context).textTheme.bodyLarge
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.black87,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100,bottom: 50),
                      child: Image(image: NetworkImage(onboardingImage[1]),
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                      loadingBuilder: (context, child, loadingProgress){
                        if(loadingProgress == null)
                          {
                            return child;
                          }
                        else{
                          return  SizedBox(
                            height: 100.h,
                            width: 100.w,
                            child: const Center(
                              child: CircularProgressIndicator(color: Colors.orange,),
                            ),
                          );
                        }
                      },),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(onboardingText[1],
                          style: Theme.of(context).textTheme.bodyLarge
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.black87,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100,bottom: 50),
                      child: Image(image: AssetImage(onboardingImage[2])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(onboardingText[2],
                          style: Theme.of(context).textTheme.bodyLarge
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.black87,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Image(image: AssetImage(onboardingImage[3])),
                    ),
                   Padding(
                     padding: const EdgeInsets.only(top: 150),
                     child: Column(
                       children: [
                         Text(onboardingText[3],
                             style: Theme.of(context).textTheme.bodyLarge
                         ),
                          SizedBox(height: 50.h,),
                         Container(
                           margin: const EdgeInsets.only(left: 30,right: 30),
                           child: MaterialButton(
                             onPressed: (){
                               Navigator.pushNamed(context, LoginScreen.routeName);
                             },

                             color: const Color.fromRGBO(255, 187, 59, 90),
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(40)
                             ),
                             height: 60.h,
                             minWidth: double.infinity,
                             child:   Text("Get Started",
                                 style:TextStyle(color: Colors.white38,fontSize: 40.sp)
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                  ],
                ),
              ),

            ],

          ),
          Builder(builder:  (context) => Align(
            alignment: Alignment.bottomCenter,
            child:Padding(
              padding: const EdgeInsets.only(bottom: 30,left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){
                    setState(() {
                      controller.jumpToPage(3);

                    });
                  }, child:  Text("Skip",style: TextStyle(
                      color: const Color.fromRGBO(255, 187, 59, 1),
                      fontSize: 25.sp
                  ),)),
                  Row(
                    children: [
                      Indicator(currentPosition: 0,currentIndex:currentIndex),
                       SizedBox(width: 5.w,),
                      Indicator(currentPosition: 1,currentIndex:currentIndex),
                       SizedBox(width: 5.w,),
                      Indicator(currentPosition: 2,currentIndex:currentIndex),
                       SizedBox(width: 5.w,),
                      Indicator(currentPosition: 3,currentIndex:currentIndex),
                       SizedBox(width: 20.w,),
                    ],
                  ),
                  TextButton(onPressed: (){
                   setState(() {
                     controller.nextPage(
                         duration: const Duration(milliseconds: 500),
                         curve: Curves.easeIn);

                   });
                  }, child:  Text("Next",style: TextStyle(
                    color: const Color.fromRGBO(255, 187, 59, 1),
                    fontSize: 25.sp
                  ),)),
                ],
              ),
            ),

          ),)
        ],
      ),
    );
  }
}
