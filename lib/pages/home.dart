import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Utility/screen_size.dart';
import 'package:newsapp/models/category_models.dart';
import 'package:newsapp/models/slider_model.dart';
import 'package:newsapp/services/data.dart';
import 'package:newsapp/services/slider_dara.dart';
import 'package:newsapp/widgets/build_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModels> category = [];
  List<SliderModel> sliders = [];

  @override
  void initState() {
    category = getcategory();
    sliders = getslider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
  backgroundColor: const Color(0xFFEFEFEF),
  elevation: 0, // No shadow
  scrolledUnderElevation: 0, 
  surfaceTintColor: Colors.transparent, 
  centerTitle: true,
  title: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'Viral',
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(width: 5),
      Text(
        'News',
        style: GoogleFonts.poppins(
          color: Colors.black45,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),

      body: Padding(
        padding: const EdgeInsets.only(top: 23, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(
              height: ScreenUtil.height / 9.9,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: 50,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                              category[index].categoryimage.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            category[index].categoryname.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
            const SizedBox(height: 20),

          
            const Row(
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
            const SizedBox(height: 15),

            CarouselSlider.builder(
              itemCount: sliders.length,
              itemBuilder: (context, index, realindex) {
                String? res = sliders[index].image;
                String? res1 = sliders[index].name;

                return buildimage(res!, index, res1!);
              },
              options: CarouselOptions(
                height: 230,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
            const SizedBox(height: 25),

           
            const Row(
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
            const SizedBox(height: 10),

            
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                   
                      Material(
                        elevation: 3,
                        child: Container(
                          height: 230,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                // borderRadius: const BorderRadius.only(
                                //   topLeft: Radius.circular(13),
                                //   bottomLeft: Radius.circular(13),
                                // ),
                                child: Image.asset(
                                  'asset/images/news1.jpg',
                                  height: 190,
                                  width: ScreenUtil.width / 2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 35, left: 15, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Trending news is waiting for you to watch",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Get the latest updates on world events now.",
                                        style:
                                            TextStyle(color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                       Material(
                        elevation: 3,
                        child: Container(
                          height: 230,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                // borderRadius: const BorderRadius.only(
                                //   topLeft: Radius.circular(13),
                                //   bottomLeft: Radius.circular(13),
                                // ),
                                child: Image.asset(
                                  'asset/images/news1.jpg',
                                  height: 190,
                                  width: ScreenUtil.width / 2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 35, left: 15, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Trending news is waiting for you to watch",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        "Get the latest updates on world events now.",
                                        style:
                                            TextStyle(color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
