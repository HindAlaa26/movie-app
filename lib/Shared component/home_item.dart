import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Home/item_details.dart';
import 'package:movie_app/models/home_model.dart';

class HomeItem extends StatefulWidget {
  List<HomeModel> homeModels;

  HomeItem({Key? key, required this.homeModels}) : super(key: key);

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: 1000,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetails(
                      title: widget.homeModels[index].title,
                      image: widget.homeModels[index].image,
                      overview: widget.homeModels[index].overview,
                      posterPath: widget.homeModels[index].posterPath,
                      releaseDate: widget.homeModels[index].releaseDate,
                      voteAverage: widget.homeModels[index].voteAverage,
                      isFavorite: false,
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: 520,
                width: 360,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey.shade700)],
                    color: const Color.fromRGBO(112, 112, 112, 100),
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          //image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                              image: NetworkImage("https://image.tmdb.org/t/p/original/${widget.homeModels[index].posterPath}"),
                              height: 370,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
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
                          ),
                          //favorite

                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.star, color: Colors.yellow, size: 30),
                              const SizedBox(width: 10),
                              Text("${widget.homeModels[index].voteAverage }"?? "movie rate", style: const TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.white)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(widget.homeModels[index].title ?? "movie name", style: const TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.white),textAlign: TextAlign.center,),
                          const SizedBox(height: 10),
                          Text(widget.homeModels[index].releaseDate ?? "movie Date", style:   TextStyle(fontSize: 20,decoration: TextDecoration.none,color: Colors.grey[800])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15,),
          itemCount: widget.homeModels.length),
    );
  }
}