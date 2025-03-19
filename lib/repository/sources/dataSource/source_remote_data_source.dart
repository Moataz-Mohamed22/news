import 'package:news/model/SourceRespons.dart';

///todo:interface
/// online class
abstract class SourceRemoteDataSource{
  Future<SourceResponse?> getSources(String categoryId);
}
abstract class SourceLocalDataSource{
}
