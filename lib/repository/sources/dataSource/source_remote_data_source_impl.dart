import 'package:news/model/SourceRespons.dart';
import 'package:news/repository/sources/dataSource/source_remote_data_source.dart';

import '../../../Api/Api_Manager.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager ;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId) async{
      var response= await apiManager.getSoureces(categoryId);
      return response ;
  }
}