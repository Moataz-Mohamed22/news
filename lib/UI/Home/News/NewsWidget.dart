import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Api/Api_Manager.dart';
import 'package:news/UI/Home/News/Cubit/News_States.dart';
import 'package:news/UI/Home/News/Cubit/News_view_model.dart';
import 'package:news/UI/Home/News/News_item.dart';
import 'package:news/di/di.dart';
import 'package:news/model/NewsRespons.dart';
import 'package:news/model/SourceRespons.dart';
import 'package:news/utils/App_Colors.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}


class _NewsWidgetState extends State<NewsWidget> {
  @override
 
  NewsViewModel viewModel = NewsViewModel(newsRepository: injectNewsRepository());
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ??"");
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsStates>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.grey,
              ),
            );
          } else if (state is NewsErrorState) {
            return Center(
              child: Column(
                children: [
                  const Text("Something went wrong..."),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.getNewsBySourceId(widget.source.id??"");
                    },
                    child: const Text("Try again!"),
                  ),
                ],
              ),
            );
          } else if (state is NewsSuccessState) {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, indxe) {
                  return NewsItem(news: state.newsList[indxe]);
                },
                itemCount: state.newsList.length,
              ),
            );
          }
          return Container(); 
        },
      ),
    );
  }
}



    /*FutureBuilder<NewsRespons?>
      (future:ApiManager.getNewsBySourceId(widget.source.id ??"") ,
        builder: (context ,snapshot){
      if (snapshot.connectionState == ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.grey,
          ),
        );
      }else if (snapshot.hasError){
        return Center(
          child: Column(
            children: [
              const Text( "Something went wrong..." ,),
              ElevatedButton(onPressed: (){
                ApiManager.getNewsBySourceId(widget.source.id??"");
                setState(() {

                });
              }, child: const Text("Try again!"))
            ],
          ),
        );

      }
      if(snapshot.data!.status !="ok"){
        return Center(
          child: Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(onPressed: (){
                ApiManager.getNewsBySourceId(widget.source.id??"");
                setState(() {

                });
              }, child: const Text("Try again!"))
            ],
          ),
        );
      }
      var newsList =snapshot.data!.articles!;
      return Expanded(
        child: ListView.builder(itemBuilder: (context , indxe){
          return NewsItem(news: newsList[indxe])
          ;
        },itemCount: newsList.length,),
      );
        }
    );
  }
}*/
