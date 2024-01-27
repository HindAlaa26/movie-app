import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../models/home_model.dart';
import '../../provider/favorite_provider.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final String? overview;
  final String? image;
  final String? posterPath;
  final String? releaseDate;
  final double? voteAverage;
   bool? isFavorite;

  ItemDetails(
      {required this.title,
      required this.overview,
      required this.image,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.isFavorite});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,bottom: 25),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                    icon: const Icon(Icons.arrow_back,size: 30,)),
                Expanded(child: Text("$title",style:  Theme.of(context).textTheme.displaySmall,maxLines: 1,)),
              ],
            ),
          ),
            Stack(
              children: [
                Image(
                  image: NetworkImage("https://image.tmdb.org/t/p/original/$image"),
                  height: 375.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error,color: Colors.white),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return  Center(
                        child: SizedBox(
                          height: 50.h,
                          width: 50.w,
                          child:  CircularProgressIndicator(color: Theme.of(context).indicatorColor),
                        ),
                      );
                    }
                  },
                ),
                Consumer<FavoriteProvider>(builder: (context, value, child) {
                  return  GestureDetector(
                    onTap: () {
                      value.addToFavorites(HomeModel(title:title,
                          overview: overview,
                          image:image,
                          releaseDate:releaseDate,
                          voteAverage:voteAverage ,
                          posterPath:posterPath));

                        isFavorite = !isFavorite!;
                      print("add to favorite ");
                    },
                    child: Stack(
                      children: [
                        isFavorite! ?  Icon(Icons.bookmark, color: Theme.of(context).indicatorColor, size: 55) : const Icon(Icons.bookmark, color: Colors.grey, size: 55),
                        Positioned(
                          top: 7,
                          left: 8,
                          child: isFavorite! ? const Icon(Icons.check, color: Colors.white, size: 35) : const Icon(Icons.add, color: Colors.white, size: 35),
                        ),
                      ],
                    ),
                  );
                },)
              ],
            ),

            //movie name
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 15),
              child: Column(
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Movie Name:",style:  Theme.of(context).textTheme.labelLarge,),
                    ],
                  ),
                   SizedBox(height: 13.h,),
                  Row(
                    children: [
                      Expanded(child: Text("$title",style: Theme.of(context).textTheme.displaySmall,maxLines: 5,)),
                    ],
                  ),
                ],
              ),
            ),
            // release date
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 15),
              child: Row(
                children: [
                   Text("Release Date: ",style: Theme.of(context).textTheme.labelLarge,),
                  SizedBox(width: 5,),
                  Text("$releaseDate",style:  Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            //overview
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 15,right: 5),
              child: Column(
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Overview",style: Theme.of(context).textTheme.labelLarge),
                    ],
                  ),
                   SizedBox(height: 13.h,),
                  Text("$overview",style: Theme.of(context).textTheme.displaySmall,maxLines: 100,),
                ],
              ),
            ),
            //Vote Average
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 15,bottom: 20),
              child: Row(
                children: [
                   Text("Vote Average: ",style:  Theme.of(context).textTheme.labelLarge,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 30),
                       SizedBox(width: 10.w),
                      Text("$voteAverage", style: Theme.of(context).textTheme.displaySmall),
                    ],
                  ),
                ],
              ),
            ),
        ],),
      ),
    );
  }
}
