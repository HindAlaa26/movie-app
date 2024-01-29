import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/home_model.dart';
import '../../Shared/Network/remote/movie_service/movie_service.dart';
import '../../Shared/shared_component/home_item.dart';

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
              child:  Center(child: CircularProgressIndicator(color: Theme.of(context).indicatorColor,)),
            );
          }
        },);
  }
}
