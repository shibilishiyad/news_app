import 'package:flutter/material.dart';
import 'package:newsapp/Utility/screen_size.dart';

Widget buildimage(String image, int index, String name) => Stack(children: [
  Image.asset(
    image,
    fit: BoxFit.cover,
    width: ScreenUtil.width,
  ),
  Container(
    margin:const EdgeInsets.only(top: 120),
    width:ScreenUtil.width,
    color:  Colors.black38,
    child: Center(
      
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Text(name,style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),),
      ),),)
  ],
);
