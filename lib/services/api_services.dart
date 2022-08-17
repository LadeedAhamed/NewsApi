import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/model/model_class.dart';


  Future<List<Article>> fetchNewsApi() async {
    final response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=17da2d31c3024cbb9523f12028ccdb92"));

    if (response.statusCode == 200) {
         Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];
      // print(body);
       List<Article> articles =body.map((dynamic item) => Article.fromMap(item)).toList();
       return articles;
        // List<dynamic> parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      //  print(response.body);
        //  return parsed.map<NewsApi>((json) => NewsApi.fromMap(json)).toList();
    } else {
      throw ("can't get the Articles");
    }
  }
