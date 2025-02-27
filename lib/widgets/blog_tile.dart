import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Utility/screen_size.dart';
import 'package:newsapp/pages/article_view.dart';

// ignore: must_be_immutable
class BlogTile extends StatelessWidget {
  String imageurl, title, description,url;

  BlogTile(
      {super.key,
      required this.description,
      required this.imageurl,
      required this.title,required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Article_View(blogurl: url)));
      },
      child: Material(
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
                child: CachedNetworkImage(
                  imageUrl: imageurl,
                  height: 210,
                  width: ScreenUtil.width / 2,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, left: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3, 
                        overflow: TextOverflow.ellipsis, 
                      ),
                      const SizedBox(height: 8),
                    
                      Expanded(
                        child: Text(
                          description,
                          style: const TextStyle(color: Colors.black45),
                          maxLines: 5, 
                          overflow: TextOverflow.ellipsis, 
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
    );
  }
}
