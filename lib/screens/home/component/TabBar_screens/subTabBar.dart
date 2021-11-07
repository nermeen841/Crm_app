import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/home/component/TabBar_screens/tasks_list_tapbar.dart';
import 'package:flutter/material.dart';

import 'done_tasks.dart';


class SubTabBar extends StatefulWidget {

  @override
  _SubTabBarState createState() => _SubTabBarState();
}
class _SubTabBarState extends State<SubTabBar> with SingleTickerProviderStateMixin {
  late  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this,initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        primary: true,
        children: [
          Container(

            padding: EdgeInsets.only( left: 50),
            height: 40,
            width: 380,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController,
              labelColor:HexColor('#2972B7'),
              labelStyle: TextStyle(
                fontFamily: "Cairo",fontSize: 14,fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: "Cairo",fontSize: 14,fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: HexColor('#626262'),
              tabs: [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'مهام مكتمله',
                ),
                Tab(
                  text: 'قائمة المهام',
                ),
              ],
            ),
          ),

           Container(
       height: MediaQuery.of(context).size.height*0.93,
         child: TabBarView(
                  controller: _tabController,
                  children: [
                    DoneTasks(),
                    TasksListTapBar(),
                  ]),
       ),
        ],
      ),
    );
  }
}
