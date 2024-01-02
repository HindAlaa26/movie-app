import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Shared%20component/home_item.dart';
import 'package:movie_app/models/home_model.dart';
import 'package:movie_app/movie_service/movie_service.dart';

class HomeBuilder extends StatefulWidget {
  String title;
   HomeBuilder({super.key,required this.title});

  @override
  State<HomeBuilder> createState() => _HomeBuilderState();
}

class _HomeBuilderState extends State<HomeBuilder> {
   var movieFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieFuture = MovieService().getMovie(title: widget.title );
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HomeModel>>(
        future: movieFuture,
        builder: (context, snapshot) {
          if(snapshot.hasData)
            {
              return HomeItem(homeModels: snapshot.data!);
              //return  const Text("data");
            }
          else if(snapshot.hasError)
            {
              return  SizedBox(
                height: 458.h,
                child: const Text("Error when loading data"),
              );
            }
          else
          {
            return  SizedBox(
              height: 458.h,
              child: const Center(child: CircularProgressIndicator()),
            );
          }
        },);
  }
}
