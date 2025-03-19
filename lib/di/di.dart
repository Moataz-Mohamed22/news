import 'package:news/Api/Api_Manager.dart';
import 'package:news/repository/news/dataSource/news_remote_dataSource.dart';
import 'package:news/repository/news/dataSource/news_remote_dataSource_impl.dart';
import 'package:news/repository/news/repository/news_repository.dart';
import 'package:news/repository/news/repository/news_repository_impl.dart';
import 'package:news/repository/sources/dataSource/source_remote_data_source.dart';
import 'package:news/repository/sources/dataSource/source_remote_data_source_impl.dart';
import 'package:news/repository/sources/repository/sourceRepository.dart';
import 'package:news/repository/sources/repository/source_repository_impl.dart';

SourceRepository injectSourceRepository (){
return SourceRepositoryImpl(remoteDataSource: injectRemoteDataSource());
}
SourceRemoteDataSource injectRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManager: injectApiManager());
}
ApiManager injectApiManager(){
  return ApiManager();
}
NewsRepository injectNewsRepository (){
return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
}
NewsRemoteDataSource injectNewsRemoteDataSource(){
  return  NewsRemoteDataSourceImpl(apiManager: injectApiManager());
}