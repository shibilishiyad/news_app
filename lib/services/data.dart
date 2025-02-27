import 'package:newsapp/models/category_models.dart';

List<CategoryModels> getcategory() {
  List<CategoryModels> categorys = [];

  categorys.add(CategoryModels(
    categoryname: "Trade",
    categoryimage: "asset/images/business.jpg",
  ));

  categorys.add(CategoryModels(
    categoryname: "Shows",
    categoryimage: "asset/images/entertainment.jpg",
  ));

  categorys.add(CategoryModels(
    categoryname: "Sports",
    categoryimage: "asset/images/sports.jpg",
  ));

  categorys.add(CategoryModels(
    categoryname: "Science",
    categoryimage: "asset/images/science.jpg",
  ));

  categorys.add(CategoryModels(
    categoryname: "Tech",
    categoryimage: "asset/images/technology.jpg",
  ));

  return categorys;
}
