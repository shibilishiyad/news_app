import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Utility/screen_size.dart';
import 'package:newsapp/pages/slider_view.dart';

Widget buildimage(String image, int index, String name, String newsUrl, BuildContext context) => Stack(
  children: [
    InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SliderWebView(url: newsUrl),
          ),
        );
      },
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        width: ScreenUtil.width,
      ),
    ),
    Container(
      margin: const EdgeInsets.only(top: 140),
      width: ScreenUtil.width,
      color: Colors.black54,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  ],
);
