import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/home_model.dart';
import '../../providers/favorite_provider.dart';

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

    return SingleChildScrollView(
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
              Expanded(child: Text("$title",style: const TextStyle(color: Colors.white,fontSize: 20,decoration: TextDecoration.none))),
            ],
          ),
        ),
          Stack(
            children: [
              Image(
                image: NetworkImage("https://image.tmdb.org/t/p/original/$image"),
                height: 370,
                width: double.infinity,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error,color: Colors.white),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(color: Colors.orange),
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
                      isFavorite! ? const Icon(Icons.bookmark, color: Colors.orange, size: 55) : const Icon(Icons.bookmark, color: Colors.grey, size: 55),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Movie Name:",style:  TextStyle(color: Colors.orange,fontSize: 25,decoration: TextDecoration.none),),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(child: Text("$title",style: const TextStyle(color: Colors.white,fontSize: 25,decoration: TextDecoration.none))),
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
                const Text("Release Date: ",style:  TextStyle(color: Colors.orange,fontSize: 25,decoration: TextDecoration.none),),
                Text("$releaseDate",style: const TextStyle(color: Colors.grey,fontSize: 20,decoration: TextDecoration.none)),
              ],
            ),
          ),
          //overview
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 15,right: 5),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Overview",style:  TextStyle(color: Colors.orange,fontSize: 25,decoration: TextDecoration.none),),
                  ],
                ),
                const SizedBox(height: 15,),
                Text("$overview",style:  TextStyle(color: Colors.grey[350],fontSize: 20,decoration: TextDecoration.none)),
              ],
            ),
          ),
          //Vote Average
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 15,bottom: 20),
            child: Row(
              children: [
                const Text("Vote Average: ",style:  TextStyle(color: Colors.orange,fontSize: 25,decoration: TextDecoration.none),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 30),
                    const SizedBox(width: 10),
                    Text("$voteAverage", style: const TextStyle(fontSize: 20,color: Colors.white,decoration: TextDecoration.none)),
                  ],
                ),
              ],
            ),
          ),
      ],),
    );
  }
}
