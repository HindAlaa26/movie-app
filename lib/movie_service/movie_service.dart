import 'package:dio/dio.dart';
import 'package:movie_app/models/home_model.dart';

class MovieService
{
  final Dio dio = Dio();
  String? title;
  Future<List<HomeModel>> getMovie({required String title})async
  {
    this.title = title;
    Response response = await dio.get('https://api.themoviedb.org/3/movie/$title?api_key=0dfb8ebd31e4385742e80860df272968');
    Map<String,dynamic> fromJson = response.data;
    List<dynamic> results = fromJson['results'];
    List<HomeModel> resultList = [];
    for(var result in results)
    {
      HomeModel homeModel = HomeModel.fromJson(result);
      resultList.add(homeModel);
    }
    return resultList;

  }
}