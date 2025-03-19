
import 'package:news/Api/Api_Manager.dart';
import 'package:news/model/SourceRespons.dart';
import 'package:news/repository/sources/dataSource/source_remote_data_source.dart';
import 'package:news/repository/sources/repository/sourceRepository.dart';

class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource remoteDataSource ;
  SourceRepositoryImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse?> getSources(String categoryId) async{
return remoteDataSource.getSources(categoryId);
  }
}