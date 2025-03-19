import 'package:news/model/NewsRespons.dart';

abstract class NewsRemoteDataSource{
 Future<NewsRespons?> getNewsBySourceId(String sourceId);
}