import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/models/artical_model.dart';
import 'package:newsapp/services/show_category_news.dart';
import 'package:newsapp/widgets/blog_tile.dart';

class CategoryNewsPage extends StatefulWidget {
  final String categoryName;

  const CategoryNewsPage({super.key, required this.categoryName});

  @override
  State<CategoryNewsPage> createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  List<ArticalModel> categoryArticles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchCategoryNews(widget.categoryName);
  }

  void fetchCategoryNews(String categoryName) async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(categoryName);

    setState(() {
      categoryArticles = showCategoryNews.categories
          .map((category) => ArticalModel(
                title: category.title,
                description: category.description,
                urlToImage: category.urlToImage,
                url: category.url,
              ))
          .toList();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: categoryArticles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: BlogTile(
                    url: categoryArticles[index].url!,
                    description: categoryArticles[index].description!,
                    imageurl: categoryArticles[index].urlToImage ??
                        'https://via.placeholder.com/200',
                    title: categoryArticles[index].title!,
                  ),
                );
              },
            ),
    );
  }
}

// Update your category tap logic:

// onTap: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => CategoryNewsPage(
//         categoryName: category[index].categoryname.toString(),
//       ),
//     ),
//   );
// },

// // Now, when the user taps a category, they'll navigate to a new page with relevant news!
