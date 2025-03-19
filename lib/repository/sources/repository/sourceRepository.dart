//todo: interface

import 'package:news/model/SourceRespons.dart';

abstract class SourceRepository{
 Future<SourceResponse?> getSources(String categoryId);
}