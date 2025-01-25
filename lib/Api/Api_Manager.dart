import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Api/End_points.dart';
import 'package:news/Api/api_Constants.dart';
import 'package:news/model/NewsRespons.dart';
import 'package:news/model/SourceRespons.dart';

class ApiManager {
  static Future<SourceResponse?> getSoureces(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,
        {"apiKey": ApiConstants.apiKey ,
        "category":categoryId});
    try {
      var response = await http.get(url);
      var responseBody = response.body; //String

      var json = jsonDecode(responseBody); //json
     return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
static Future<NewsRespons?> getNewsBySourceId(String sourceId) async{
    Uri url =Uri.https(ApiConstants.baseUrl ,EndPoints.newsApi ,{
      "apiKey":ApiConstants.apiKey,
      "sources":sourceId
    });
    try{
      var response= await http.get(url);
      return NewsRespons.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }

}
}
