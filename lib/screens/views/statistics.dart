import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {

  int itemIndex = 0;
  int itemCount = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffee9ca7).withOpacity(.7),
            Color(0xffffdde1),
            Color(0xffC0EBF2).withOpacity(.3),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )
      ),
      child: Column(
        children: [
          SizedBox(height: Get.mediaQuery.padding.top + 70,width: double.infinity,),
          Container(
            height: Get.height * .4,
            child: Swiper(
              onIndexChanged: (int){
                setState(() {
                  itemIndex = int;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          '\$${Random().nextInt(5000)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                          ),
                        ),
                        subtitle: Text(
                          '${DateFormat('MMMM').format(DateTime.now().add(Duration(days: 30*index)))}',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                        trailing: Icon(
                          Icons.more_vert,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                );
              },
              itemWidth: Get.width * .8,
              itemCount: itemCount,
              layout: SwiperLayout.STACK,
            ),
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i=0;i<itemCount;i++)
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i==itemIndex ? Colors.blue : Colors.white
                    ),
                  ),
                )
            ],
          )

        ],
      ),
    );
  }
}
