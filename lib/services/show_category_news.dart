import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/show_category.dart';


class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoriesNews(String category) async {
    String url = 'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=faaadc07cff54da88c8e9bae04748cd9';


    var response = await http.get(Uri.parse(url));
    print("API Response: ${response.body}");

    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == "ok") {
      jsondata["articles"].forEach((element) {
        if (element["description"] != null && element["urlToImage"] != null) {
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            title: element["title"] ?? "No Title",
            description: element["description"],
            author: element["author"] ?? "Unknown Author",
            urlToImage: element["urlToImage"],
            url: element["url"] ?? "",
            content: element["content"] ?? "",
          );
          categories.add(showCategoryModel );
        }
      });
    } else {
      print("Failed to load news:");
    }
  }
}
