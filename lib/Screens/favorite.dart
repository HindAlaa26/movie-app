import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/favorite_provider.dart';
import 'Home/item_details.dart';


class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(builder: (context, value, child) {
      return
        value.favoriteItems.isEmpty ?  Center(child: Text(
          "There are no favorite movie yet !",
          style: TextStyle(color: Colors.orange, fontSize: 18.sp),)) :
        ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ItemDetails(
                            title: value.favoriteItems[index].title,
                            image: value.favoriteItems[index].image,
                            overview: value.favoriteItems[index].overview,
                            posterPath: value.favoriteItems[index].posterPath,
                            releaseDate: value.favoriteItems[index].releaseDate,
                            voteAverage: value.favoriteItems[index].voteAverage,
                            isFavorite: true,
                          ),
                    ),
                  );
                },
                child: SizedBox(
                  height: 550.h,
                  width: 200.w,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey
                          .shade700)
                      ],
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
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original/${value
                                        .favoriteItems[index].posterPath}"),
                                height: 355.h,
                                width: double.infinity,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error,
                                    stackTrace) => const Icon(Icons.error),
                                loadingBuilder: (context, child,
                                    loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return  Center(
                                      child: SizedBox(
                                        height: 50.h,
                                        width: 50.w,
                                        child: const CircularProgressIndicator(
                                            color: Colors.orange),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            //favorite

                            GestureDetector(
                              onTap: () {
                                value.removeFromFavorites(
                                    value.favoriteItems[index]);

                                // isFavorite = !isFavorite;
                                print("remove from favorite $index");
                              },
                              child: const Stack(
                                children: [
                                  Icon(Icons.bookmark, color: Colors.orange,
                                      size: 55),
                                  Positioned(
                                    top: 7,
                                    left: 8,
                                    child: Icon(
                                        Icons.check, color: Colors.white,
                                        size: 35),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                         SizedBox(height: 15.h),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                    Icons.star, color: Colors.yellow, size: 30),
                                 SizedBox(width: 10.w),
                                Text("${value.favoriteItems[index]
                                    .voteAverage}" ?? "movie rate",
                                    style:  TextStyle(fontSize: 18.sp,
                                        decoration: TextDecoration.none,
                                        color: Colors.white)),
                              ],
                            ),
                             SizedBox(height: 10.h),
                            Text(value.favoriteItems[index].title ??
                                "movie name", style:  TextStyle(
                                fontSize: 17.sp,
                                decoration: TextDecoration.none,
                                color: Colors.white)),
                             SizedBox(height: 8.h),
                            Text(value.favoriteItems[index].releaseDate ??
                                "movie Date", style:  TextStyle(
                                fontSize: 20.sp,
                                decoration: TextDecoration.none,
                                color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) =>  SizedBox(height: 5.h,),
            itemCount: value.favoriteItems.length);
    },);
  }
}
