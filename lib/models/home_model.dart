class HomeModel
{
  final String title;
  final String overview;
  final String image;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  HomeModel({required this.title, required this.overview, required this.image,required this.releaseDate
  , required this.voteAverage,
    required this.posterPath});

  factory HomeModel.fromJson(Map<String,dynamic> json)
  {
    return HomeModel(    title: json['title'], overview: json['overview'], image: json['backdrop_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      posterPath: json['poster_path']);
  }

}