import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/onBoarding/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'component/TabBar_screens/subTabBar.dart';
import 'component/leads/leads.dart';


//Home Don\'t Have Tasks
class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin
{

late  TabController _tabController;

var scaffoldKey = GlobalKey<ScaffoldState>();


@override
void initState() {
  _tabController = TabController(length: 2, vsync: this,initialIndex: 1);
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawer(context: context),
      appBar: customeAppbar(title: "الرئيسية", press:()=>scaffoldKey.currentState!.openDrawer(), context: context),
    body: ListView(
      shrinkWrap: true,
      primary: true,
      padding: EdgeInsets.symmetric( horizontal: 10,vertical: 10),
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric( horizontal: 10,vertical: 10),
          width: double.infinity,
           height: 63,
           decoration: BoxDecoration(
             color: HexColor('#E6E6E6'),
              borderRadius: BorderRadius.circular(10)
            ),


           child: TabBar(
             controller: _tabController,
             // indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
             indicator: BoxDecoration(
               borderRadius: BorderRadius.circular(
                 10.0,
               ),
               color: Colors.white,
               //E6E6E6
             ),
             labelColor:HexColor('#2972B7'),
             indicatorSize: TabBarIndicatorSize.tab,
             labelStyle: TextStyle(
               fontFamily: "Cairo",fontSize: 14,fontWeight: FontWeight.bold,
             ),
             unselectedLabelStyle: TextStyle(
               fontFamily: "Cairo",fontSize: 14,fontWeight: FontWeight.bold,
             ),
             unselectedLabelColor: HexColor('#626262'),
             tabs: [
               Tab(
                 text: 'قائمة العملاء',
               ),

               Tab(
                 text: 'مهامي',
               ),
             ],
           ),
        ),
        SizedBox(
          height: 20,
        ),
        myDivider(5),
       Container(
          height: MediaQuery.of(context).size.height,
         child: TabBarView(
           controller: _tabController,
             children: [
               LeadsScreen(),
               SubTabBar(),
             ]),
       ),
      ],
    ),
    );
  }
}
