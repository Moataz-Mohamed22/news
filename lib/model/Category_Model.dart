import 'package:news/utils/Assets_manager.dart';

class CategoryModel{
  String id ;
  String titel ;
  String imagePath;
  CategoryModel({required this.id ,required this.titel , required this.imagePath});
///business entertainment general health science sports technology. Default:
  static List<CategoryModel> getCategoryiesList (){
    return [
      CategoryModel(id:"general" ,imagePath:AssetsManager.generalLight ,titel:"General" ),


      CategoryModel(id:"business" ,imagePath:AssetsManager.businessLight ,titel:"Business" ),
      CategoryModel(id:"sports" ,imagePath:AssetsManager.sportsLight,titel:"Sports" ),

      CategoryModel(id:"entertainment" ,imagePath:AssetsManager.EntertainmentLight ,titel:"Entertainment" ),

      CategoryModel(id:"science" ,imagePath:AssetsManager.scienceLight ,titel:"Science " ),
      CategoryModel(id:"health" ,imagePath:AssetsManager.healthLight ,titel:"Health" ),

      CategoryModel(id:"technology" ,imagePath:AssetsManager.technologyLight ,titel:"Technology" ),
    ];
  }//86598e9d4eb84b9aa9097d0946d10df2
}
