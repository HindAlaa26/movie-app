import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/favorite_provider.dart';
import 'Home/item_details.dart';

class Favorite extends StatefulWidget {
  static String routeName = 'Favorite screen';
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  @override
  Widget build(BuildContext context) {
    var favoriteProvider = Provider.of<FavoriteProvider>(context);
    return favoriteProvider.favoriteItem.isEmpty
        ? Center(
            child: Text(
            "There are no favorite movie yet !",
            style: Theme.of(context).textTheme.titleLarge,
          ))
        : ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDetails(
                        title: favoriteProvider.favoriteItem[index].title,
                        image: favoriteProvider.favoriteItem[index].image,
                        overview: favoriteProvider.favoriteItem[index].overview,
                        posterPath:
                            favoriteProvider.favoriteItem[index].posterPath,
                        releaseDate:
                            favoriteProvider.favoriteItem[index].releaseDate,
                        voteAverage:
                            favoriteProvider.favoriteItem[index].voteAverage,
                        isFavorite: true,
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  height: 550.h,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 3, color: Colors.grey.shade700)
                      ],
                      color: Theme.of(context).hoverColor,
                    ),
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            //image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original/${favoriteProvider.favoriteItem[index].posterPath}"),
                                height: 355.h,
                                width: double.infinity,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: SizedBox(
                                        height: 50.h,
                                        width: 50.w,
                                        child: CircularProgressIndicator(
                                            color: Theme.of(context)
                                                .indicatorColor),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            //favorite
                            GestureDetector(
                              onTap: () {
                                favoriteProvider.removeFromFavorites(
                                    favoriteProvider.favoriteItem[index]);

                                print("remove from favorite $index");
                              },
                              child: Stack(
                                children: [
                                  Icon(Icons.bookmark,
                                      color: Theme.of(context).indicatorColor,
                                      size: 55),
                                  Positioned(
                                    top: 7,
                                    left: 8,
                                    child: Icon(Icons.check,
                                        color: Colors.white, size: 35),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15.h),
                        // item details
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.yellow, size: 30),
                                SizedBox(width: 10.w),
                                Text(
                                    "${favoriteProvider.favoriteItem[index].voteAverage}" ,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Text(
                                favoriteProvider.favoriteItem[index].title ??
                                    "movie name",
                                style: Theme.of(context).textTheme.titleMedium),
                            SizedBox(height: 8.h),
                            Text(
                                favoriteProvider
                                        .favoriteItem[index].releaseDate ??
                                    "movie Date",
                                style: Theme.of(context).textTheme.labelMedium),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 5.h,
                ),
            itemCount: favoriteProvider.favoriteItem.length);
  }
}
