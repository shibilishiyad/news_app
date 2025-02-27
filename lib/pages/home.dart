import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Utility/screen_size.dart';
import 'package:newsapp/models/artical_model.dart';
import 'package:newsapp/models/category_models.dart';
import 'package:newsapp/models/slider_model.dart';
import 'package:newsapp/services/data.dart';
import 'package:newsapp/services/news.dart';
import 'package:newsapp/services/show_category_news.dart';
import 'package:newsapp/services/slider_dara.dart';
import 'package:newsapp/widgets/blog_tile.dart';
import 'package:newsapp/widgets/build_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModels> category = [];
  List<SliderModel> sliders = [];
  List<ArticalModel> articals = [];
  bool _loading = true;
  // ignore: unused_field
  bool _categoryLoading = false;
  String appBarTitle = 'Viral News';
  int selectedIndex = -1;
  String selectedCategoryName = '';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    category = getcategory();

    getslider();

    getnews();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 400) {
        setState(() {
          appBarTitle =
              (selectedIndex != -1) ? selectedCategoryName : 'Trending News!';
        });
      } else {
        setState(() {
          appBarTitle = 'Viral News';
        });
      }
    });
  }

  getnews() async {
    News newsclass = News();
    await newsclass.getnews();
    setState(() {
      articals = newsclass.news;
      _loading = false;
    });
  }

  getslider() async {
    Sliderr slider = Sliderr();
    await slider.getslider();
    setState(() {
      sliders = slider.sliders;
      _loading = false;
    });
  }

  void fetchCategoryNews(String categoryName) async {
    setState(() {
      _categoryLoading = true;
    });

    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(categoryName);

    setState(() {
      articals = showCategoryNews.categories
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
        backgroundColor: const Color(0xFFEFEFEF),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (appBarTitle == 'Trending News!')
              Text(
                'Trending',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            else
              Text(
                appBarTitle.split(' ')[0],
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(width: 5),
            if (appBarTitle == 'Trending News!')
              Text(
                'News!',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )
            else if (appBarTitle.split(' ').length > 1)
              Text(
                appBarTitle.split(' ')[1],
                style: GoogleFonts.poppins(
                  color: Colors.black45,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFEFEFEF),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: false,
            expandedHeight: 462,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 70,
                      width: ScreenUtil.width / .2,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600,
                            offset: const Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          category.length,
                          (index) {
                            bool isSelected = index == selectedIndex;
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    selectedCategoryName =
                                        category[index].categoryname.toString();
                                  });
                                  fetchCategoryNews(selectedCategoryName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Center(
                                    child: Text(
                                      category[index].categoryname.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Breaking News!',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  _loading
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CarouselSlider.builder(
                            itemCount: sliders.length,
                            itemBuilder: (context, index, realindex) {
                              String? res = sliders[index].urlToImage ??
                                  'https://via.placeholder.com/200';
                              String? res1 = sliders[index].title;
                              String? newsUrl = sliders[index].url;

                              return buildimage(
                                  res, index, res1!, newsUrl!, context);
                            },
                            options: CarouselOptions(
                              height: 230,
                              autoPlay: true,
                              viewportFraction: 1,
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trending News!',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: articals.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: BlogTile(
                      url: articals[index].url!,
                      description: articals[index].description!,
                      imageurl: articals[index].urlToImage ??
                          'https://via.placeholder.com/200',
                      title: articals[index].title!,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
