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
      height: 550.h,
      width: 970.w,
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
                    color: Theme.of(context).hoverColor,
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Column(
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
                                  child:  CircularProgressIndicator(color: Theme.of(context).indicatorColor),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                       SizedBox(height: 25.h),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.star, color: Colors.yellow, size: 30),
                               SizedBox(width: 10.w),
                              Text("${widget.homeModels[index].voteAverage }", style:Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                           SizedBox(height: 10.h),
                          Text(widget.homeModels[index].title , style:Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,
                          maxLines: 1,),
                           SizedBox(height: 10.h),
                          Text(widget.homeModels[index].releaseDate , style: Theme.of(context).textTheme.labelMedium),
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