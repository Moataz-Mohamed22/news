import 'package:news/model/NewsRespons.dart';
import 'package:news/repository/news/dataSource/news_remote_dataSource.dart';
import 'package:news/repository/news/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsRespons?> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}
