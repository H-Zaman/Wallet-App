import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProfileTile extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  HomeProfileTile({
    this.image,
    this.title,
    this.name
});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        new ClipRect(
          clipBehavior: Clip.hardEdge,
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 20.0),
            child: new Container(
              width: 330.0,
              height: Get.height * .22,
              decoration: new BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),
        ),
        Card(
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  image
                                ),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22
                        ),
                      ),
                      SizedBox(height: 7,),
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18,bottom: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.more_horiz,
                        size: 40,
                        color: Colors.white,
                      ),
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 8,top: 8,bottom: 8),
                          child: Container(
                            height: 20,
                            width: 20,
                            child: Icon(
                              Icons.send,
                              size: 18,
                              color: Color(0xff3345E5),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}
