import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/slider_model.dart';

class Sliderr {
  List<SliderModel> sliders = [];

  Future<void> getslider() async {
    String url = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=faaadc07cff54da88c8e9bae04748cd9';


    var response = await http.get(Uri.parse(url));
    print("API Response: ${response.body}");

    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == "ok") {
      jsondata["articles"].forEach((element) {
        if (element["description"] != null && element["urlToImage"] != null) {
          SliderModel sliderModel = SliderModel(
            title: element["title"] ?? "No Title",
            description: element["description"],
            author: element["author"] ?? "Unknown Author",
            urlToImage: element["urlToImage"],
            url: element["url"] ?? "",
            content: element["content"] ?? "",
          );
          sliders.add(sliderModel );
        }
      });
    } else {
      print("Failed to load news:");
    }
  }
}
