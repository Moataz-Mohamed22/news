import 'package:news/model/NewsRespons.dart';

import '../../../Api/Api_Manager.dart';
import 'news_remote_dataSource.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManager apiManager ;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsRespons?> getNewsBySourceId(String sourceId) async{
    var response= await apiManager.getNewsBySourceId(sourceId);
    return response ;
  }
}