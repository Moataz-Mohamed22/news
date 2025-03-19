import 'package:news/model/NewsRespons.dart';

abstract class NewsRepository {
Future<NewsRespons?> getNewsBySourceId (String sourceId);
}
