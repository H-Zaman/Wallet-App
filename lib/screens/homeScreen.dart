import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_bank_ui_concept/resource/resource.dart';
import 'package:mobile_bank_ui_concept/screens/views/dashboard.dart';
import 'package:mobile_bank_ui_concept/screens/views/statistics.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _screens = [DashBoardScreen(), StatisticsScreen()];
  int _index = 0;
  String _title = 'Dashboard';
  final _sKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity,60),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        // _sKey.currentState.openDrawer();
                      },
                      child: Container(
                        height: 35,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white54,
                        ),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.menu,
                          size: 22,
                        ),
                      ),
                    ),
                    Text(
                      _title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white
                      ),
                    ),
                    InkWell(
                      onTap: () => setState((){
                        if(_index==0){
                          _index=1;
                          _title = 'Statistics';
                        }else{
                          _index=0;
                          _title = 'Dashboard';
                        }
                      }),
                      child: Container(
                        height: 35,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              Resources.profileImage
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(

      ),
      body: IndexedStack(
        children: _screens,
        index: _index,
      ),
    );
  }
}
