
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsRespons.dart';
import 'package:news/utils/App_styles.dart';

class NewsItem extends StatelessWidget {
News news ;
NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height ;
    var width =MediaQuery.of(context).size.width ;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: height *0.02,
          horizontal: width*0.04
      ),padding: EdgeInsets.symmetric(
        vertical: height *0.02,
          horizontal: width*0.01
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).indicatorColor,
          width: 2
        )
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child:CachedNetworkImage(
              imageUrl: news.urlToImage ??"",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ), 
            
          ),
          SizedBox(height: height*0.02,),

          Text(news.title ??"" ,style: Theme.of(context).textTheme.labelLarge,) ,
          SizedBox(height: height*0.02,),
          Row(
            children: [
              Expanded(child: Text(news.author ??"" ,style: AppStyles.mediuem12grey)),
              Text(news.publishedAt??""),
            ],
          )
        ],
      ),
      
    );
  }
}
