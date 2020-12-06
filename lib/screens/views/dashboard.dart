import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:mobile_bank_ui_concept/models/userModel.dart';
import 'package:mobile_bank_ui_concept/resource/userData.dart';
import 'package:mobile_bank_ui_concept/screens/views/widgets/customIconButton.dart';
import 'package:random_color/random_color.dart';

import 'widgets/customNavrRailItem.dart';
import 'widgets/homeProfileTile.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int iconId = 1;
  int selectedNavRail = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/dashboard_bg.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 70+Get.mediaQuery.padding.top,width: double.infinity,),
          profileTiles(),
          middleMenu(),
          bottomStuff(),
        ],
      ),
    );
  }

  Widget profileTiles(){
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          UserModel user = UserData.users[index];
          return HomeProfileTile(image: user.image, name: user.name, title: user.title,);
        },
        itemCount: UserData.users.length,
        itemHeight: Get.height * .22,
        itemWidth: 330.0,
        layout: SwiperLayout.STACK,
      ),
    );
  }

  Widget middleMenu(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => changeIcon(1),
              child: CustomIconButton(
                selected: iconId == 1,
                icon: Icons.pie_chart_outline_outlined,
                title: 'Account',
              ),
            ),
            InkWell(
              onTap: () => changeIcon(2),
              child: CustomIconButton(
                selected: iconId == 2,
                icon: Icons.person_outline,
                title: 'Contacts',
              ),
            ),
            InkWell(
              onTap: () => changeIcon(3),
              child: CustomIconButton(
                selected: iconId == 3,
                icon: Icons.timer_outlined,
                title: 'Transfer',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomStuff(){
    return Container(
      height: Get.height * .45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(55),
          topLeft: Radius.circular(55),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          navRail(),
          horizontalList(),
          SizedBox(height: 20,),
          helpButton(),
        ],
      ),
    );
  }

  Widget navRail(){
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
        children: [
          GestureDetector(
            onTap: () => changeNav(1),
            child: CustomNavRailItem(
              selected: selectedNavRail == 1,
              label: 'Transactions',
            ),
          ),
          GestureDetector(
            onTap: () => changeNav(2),
            child: CustomNavRailItem(
              selected: selectedNavRail == 2,
              label: 'Notifications',
            ),
          ),
          GestureDetector(
            onTap: () => changeNav(3),
            child: CustomNavRailItem(
              selected: selectedNavRail == 3,
              label: 'Requests',
            ),
          ),
          GestureDetector(
            onTap: () => changeNav(4),
            child: CustomNavRailItem(
              selected: selectedNavRail == 4,
              label: 'Subscriptions',
            ),
          ),
          GestureDetector(
            onTap: () => changeNav(5),
            child: CustomNavRailItem(
              selected: selectedNavRail == 5,
              label: 'News',
            ),
          ),
          GestureDetector(
            onTap: () => changeNav(6),
            child: CustomNavRailItem(
              selected: selectedNavRail == 6,
              label: 'Updates',
            ),
          ),
        ],
      ),
    );
  }

  Widget horizontalList(){
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20),
        shrinkWrap: true,
        itemCount: UserData.users.length,
        itemBuilder: item,
      ),
    );
  }

  Widget item(BuildContext context, int index) {
    UserData.users.shuffle();
    UserModel user = UserData.users[index];
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 180,
        width: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: RandomColor().randomColor(colorSaturation: ColorSaturation.random).withOpacity(.1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: RandomColor().randomColor(colorSaturation: ColorSaturation.random).withOpacity(.3),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      user.image
                    ),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 7,),
              Text(
                user.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              Spacer(),
              Text(
                user.date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey[500]
                ),
              ),
              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    user.balance.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blueGrey[500],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget helpButton(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[400],
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      'https://website-assets-fd.freshworks.com/attachments/cjqc9a1sg017kajfziimpg8zs-customer-rep-2x-fc261b9f.one-half.png'
                    )
                  ),
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
              Text(
                'Do you need any Help?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Icon(Icons.live_help_outlined,color: Colors.blueGrey,size: 20,),
              )
            ],
          ),
        ),
      ),
    );
  }









  changeIcon(int id){
    setState(() {
      iconId = id;
    });
  }

  changeNav(int id){
    setState(() {
      selectedNavRail = id;
    });
  }
}
