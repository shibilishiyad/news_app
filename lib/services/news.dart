import 'dart:convert';
import 'package:newsapp/models/artical_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticalModel> news = [];

  Future<void> getnews() async {
   
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=faaadc07cff54da88c8e9bae04748cd9";

    var response = await http.get(Uri.parse(url));

    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == "ok") {
      jsondata["articles"].forEach((element) {
        if (element["description"] != null && element["urlToImage"] != null) {
          ArticalModel articalModel = ArticalModel(
            title: element["title"] ?? "No Title",
            description: element["description"],
            author: element["author"] ?? "Unknown Author",
            urlToImage: element["urlToImage"],
            url: element["url"] ?? "",
            content: element["content"] ?? "",
          );
          news.add(articalModel);
        }
      });
    } else {
    }
  }
}
