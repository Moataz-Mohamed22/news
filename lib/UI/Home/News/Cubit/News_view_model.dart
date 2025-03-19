import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Api/Api_Manager.dart';
import 'package:news/UI/Home/News/Cubit/News_States.dart';
import 'package:news/repository/news/dataSource/news_remote_dataSource.dart';
import 'package:news/repository/news/dataSource/news_remote_dataSource_impl.dart';
import 'package:news/repository/news/repository/news_repository.dart';
import 'package:news/repository/news/repository/news_repository_impl.dart';

class NewsViewModel extends Cubit<NewsStates>{
late  NewsRepository newsRepository ;

  NewsViewModel({required this.newsRepository}):super(NewsLoadingState()){

  }
  void getNewsBySourceId(String sourceId) async{
    try {
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceId);
if(response?.status!="ok"){
  emit(NewsErrorState(errorMessage:response!.message! ));
  return ;
}if(response?.status =="ok"){
  emit(NewsSuccessState(newsList: response!.articles!));
  return ;
      }
    }catch(e){
emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}