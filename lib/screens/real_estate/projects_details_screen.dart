import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/onBoarding/body.dart';
import 'package:crm_app/screens/real_estate/component/component.dart';
import 'package:crm_app/screens/real_estate/controller/get_projects_and_units_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ProjectsDetailsScreen extends StatefulWidget {
static List<dynamic> units = [];
  @override
  _ProjectsDetailsScreenState createState() => _ProjectsDetailsScreenState();

}

class _ProjectsDetailsScreenState extends State<ProjectsDetailsScreen> {
  final List<String> imgList = [
    'assets/images/images 111.png'
  ];



  var scafolldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scafolldKey,
      drawer: drawer(context: context),
      appBar: AppBar(
        elevation: 1,
        title: Center(
          child: Text(' وحدات وتفاصيل المشروع', style: TextStyle(
              fontFamily: 'Cairo',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15
          ),),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: ()=> scafolldKey.currentState!.openDrawer(),
            child: Icon(Icons.more_horiz,color: Colors.black,size: 25,)),
        actions: [
          Image.asset('assets/images/avatar3 1.png',width: 30,height: 30,),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black)),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: (ProjectsDetailsScreen.units.isNotEmpty)?ListView.separated(
            itemBuilder: (context,index) => buildProjectCardDetails(
              titleName: ProjectsDetailsScreen.units[index]['name'].toString(),
              bathrooms:ProjectsDetailsScreen.units[index]['bathroom'].toString(),
              floors: ProjectsDetailsScreen.units[index]['floor'].toString(),
              Price:ProjectsDetailsScreen.units [index]['Price'].toString(),
              rooms:ProjectsDetailsScreen.units [index]['rooms'].toString(),
              spaces: ProjectsDetailsScreen.units[index]['space'].toString(),
              notes: ProjectsDetailsScreen.units[index]['notes'].toString(),
              type: ProjectsDetailsScreen.units[index]['type'].toString(),
              title:ProjectsDetailsScreen.units[index]['project']['name'].toString() ,
            ),
            separatorBuilder: (context,index) =>myDivider(1),
            itemCount: ProjectsDetailsScreen.units.length):Container(),
        // FutureBuilder(
        //   future: getProjectAndUnite(),
        //   builder: (context, AsyncSnapshot snapshot) {
        //     if (snapshot.hasData) {
        //       return ListView.separated(
        //           itemBuilder: (context,index) => buildProjectCardDetails(
        //                bathrooms:ProjectsDetailsScreen.units[index]['bathroom'].toString(),
        //                floors: ProjectsDetailsScreen.units[index]['floor'].toString(),
        //             Price:ProjectsDetailsScreen.units [index]['Price'].toString(),
        //               rooms:ProjectsDetailsScreen.units [index]['rooms'].toString(),
        //               spaces: ProjectsDetailsScreen.units[index]['space'].toString(),
        //               notes: ProjectsDetailsScreen.units[index]['notes'].toString(),
        //              type: ProjectsDetailsScreen.units[index]['type'].toString(),
        //               title: ProjectsDetailsScreen.units[index]['project']['Name'].toString(),
        //               titleName: ProjectsDetailsScreen.units[index]['name'].toString(),
        //           ),
        //           separatorBuilder: (context,index) =>myDivider(1),
        //           itemCount: ProjectsDetailsScreen.units.length);
        //     } else {
        //       return Container();
        //     }
        //   },
          // child: ListView(
          //   shrinkWrap: true,
          //   primary: true,
          //   children: [
          //     buildProjectCardDetails(title: 'وحدة 4 مساحه 35 متر ع الشارع الرئيسي', color2: HexColor('#29B784'),kind: 'سكني',),
          //     CarouselSlider(
          //       items:imgList
          //           .map((item) => Container(
          //         child: Center(
          //             child:
          //             Image.asset(item, fit: BoxFit.cover, width: 400,height: 200,)),
          //       ))
          //           .toList(),
          //       options: CarouselOptions(
          //         height: 250,
          //         initialPage: 0,
          //         viewportFraction: 1,
          //         enableInfiniteScroll: true,
          //         reverse: false,
          //         autoPlay: true,
          //         autoPlayInterval: Duration(seconds: 3),
          //         autoPlayAnimationDuration: Duration(seconds: 1),
          //         autoPlayCurve: Curves.fastOutSlowIn,
          //         scrollDirection: Axis.horizontal,
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 10),
          //       child: Text(
          //         'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما- للأحرف عوضاً عن استخدام',style: TextStyle(
          //         color: Colors.black,
          //         fontFamily: 'Cairo',
          //         fontSize: 15,
          //
          //       ),),
          //     ),
          //   ],
          // ),
        // ),
      ),
    );
  }
}
