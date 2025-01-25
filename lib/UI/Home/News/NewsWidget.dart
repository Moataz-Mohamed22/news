import 'package:flutter/material.dart';
import 'package:news/Api/Api_Manager.dart';
import 'package:news/UI/Home/News/News_item.dart';
import 'package:news/model/NewsRespons.dart';
import 'package:news/model/SourceRespons.dart';
import 'package:news/utils/App_Colors.dart';

class NewsWidget extends StatefulWidget {
Source source ;
NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsRespons?>
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
}
