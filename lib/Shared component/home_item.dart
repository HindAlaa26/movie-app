import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      height: 600.h,
      width: 1000.w,
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
                height: 500.h,
                width: 360.w,
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
                              height: 340.h,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return  Center(
                                    child: SizedBox(
                                      height: 50.h,
                                      width: 50.w,
                                      child: const CircularProgressIndicator(color: Colors.orange),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          //favorite

                        ],
                      ),
                       SizedBox(height: 10.h),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.star, color: Colors.yellow, size: 30),
                               SizedBox(width: 10.w),
                              Text("${widget.homeModels[index].voteAverage }", style:  TextStyle(fontSize: 18.sp,decoration: TextDecoration.none,color: Colors.white)),
                            ],
                          ),
                           SizedBox(height: 15.h),
                          Text(widget.homeModels[index].title ?? "movie name", style:  TextStyle(fontSize: 18.sp,decoration: TextDecoration.none,color: Colors.white),textAlign: TextAlign.center,),
                           SizedBox(height: 10.h),
                          Text(widget.homeModels[index].releaseDate ?? "movie Date", style:   TextStyle(fontSize: 18.sp,decoration: TextDecoration.none,color: Colors.grey[800])),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) =>  SizedBox(height: 13.h,),
          itemCount: widget.homeModels.length),
    );
  }
}