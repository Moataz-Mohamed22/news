import 'package:news/model/SourceRespons.dart';

abstract class SourceStates {}
class SourceInitialStates extends SourceStates {}
class SourceLoadingState extends SourceStates{}
class SourceErrorState extends SourceStates{
  String errorMessage ;
  SourceErrorState({required this.errorMessage});
}
class SourceSuccessState extends SourceStates{
  List<Source>sourcesList ;
  SourceSuccessState({required this.sourcesList});
}

