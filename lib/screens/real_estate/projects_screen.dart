import 'dart:convert';

import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:crm_app/screens/real_estate/projects_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import '../../search_class.dart';
import 'component/component.dart';
import 'controller/get_projects_and_units_api.dart';
import 'filter.dart';

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();


}

class _ProjectScreenState extends State<ProjectScreen> {

  // List<Property> properties = getPropertyList();
  // var listSearch = [];
  // Future getSearch() async
  // {
  //   var response  = await http.get(Uri.parse(EndPoints.BASE_URL+"/Units?project_id=None&city_id&governorate_id&from_price&to_price&from_space&to_space"));
  //   var data = json.decode(response.body);
  //   for(int i = 0 ; i < data.length; i ++)
  //   {
  //     listSearch.add(data[i]);
  //   }
  //   print('----------------------------$listSearch');
  //   // return data['data'];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48, left: 24, right: 24, bottom: 16),
              child: InkWell(
                onTap: ()=> showSearch(context: context, delegate: ProjectUnitSearch()),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.search),
                    Text("بحث",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1,
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 32,
                      child: Stack(
                        children: [
                          ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 24,
                              ),
                              buildFilter("الطابق"),
                              buildFilter("السعر"),
                              buildFilter("المساحة"),
                              buildFilter("عدد الغرف"),
                              buildFilter("حمامات"),
                              buildFilter("نوع العقار"),
                              buildFilter("حمام سباحة"),
                              buildFilter("المطابخ"),
                              buildFilter("المالك"),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 28,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors:[
                                    Theme.of(context).scaffoldBackgroundColor,
                                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                                  ],
                                  // List: [
                                  //     ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      print('-----------------------------------------');
                      _showBottomSheet();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 24),
                      child: Text(
                        "Filters",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 24, left: 24, top: 24, bottom: 12),
              child: Row(
                children: [
                  Text(
                    "53",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Results found",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: FutureBuilder(
                  future: getProjectAndUnite(),
              builder: (context , AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return ListView.separated(
                    primary: true,
                    shrinkWrap: true,
                    itemBuilder: (context , index) =>  InkWell(
                     onTap: (){
                       setState(() {
                         // ProjectsDetailsScreen.units.add(snapshot.data[index]['units']);
                         ProjectsDetailsScreen.units.addAll(snapshot.data[index]['units']);
                       });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProjectsDetailsScreen(

                                        )));
                          },
                      child: buildProjectCard(
                        projectName: '',
                        context: context,
                        projectID: snapshot.data[index]['id'].toString(),
                        // projectName: snapshot.data['project']['name'].toString(),
                        price: '3.000.000 ج.م',
                        type: snapshot.data[index]['type'].toString(),
                        governorate: snapshot.data[index]['governorate']['name'].toString(),
                        city:snapshot.data[index]['city']['name'].toString(),
                      ),
                    ),
                    separatorBuilder:(context , index) => myDivider(1) ,
                    itemCount: snapshot.data.length ,
                  );
                }else{
                  return Container();
                }
              } ,
            ),

    ),
            ),
          ],
        ),
      ),
    );
  }







  Widget buildFilter(String filterName){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: HexColor('#FFE0E0E0'),
          width: 1,
        )
      ),
      child: Center(
        child: Text(
          filterName,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // List<Widget> buildProperties(){
  //   List<Widget> list = [];
  //   for (var i = 0; i < properties.length; i++) {
  //     list.add(
  //       Hero(
  //         tag: properties[i].frontImage,
  //         child: buildProperty(properties[i], i)
  //       )
  //     );
  //   }
  //   return list;
  // }

  // Widget buildProperty(Property property, int index){
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) =>
  //         ProjectsDetailsScreen(),
  //         ),
  //       );
  //     },
  //     child: FutureBuilder(
  //       future: getProjectAndUnite(),
  //       builder: (context , AsyncSnapshot snapshot){
  //         if(snapshot.hasData){
  //           return ListView.separated(
  //             primary: true,
  //             shrinkWrap: true,
  //             itemBuilder: (context , index) =>  buildProjectCard(
  //                 context: context,
  //                 projectName: snapshot.data[index]['project']['name'].toString(),
  //                 price: '3.000.000 ج.م',
  //                 type: snapshot.data[index]['type'].toString(),
  //                 governorate: snapshot.data[index]['governorate']['name'].toString(),
  //                 city:snapshot.data[index]['city']['name'].toString(),
  //             ),
  //             separatorBuilder:(context , index) => myDivider(1) ,
  //             itemCount: snapshot.data.lenght ,
  //           );
  //         }else{
  //           return Container();
  //         }
  //       } ,
  //     ),
  //   );
  // }

  void _showBottomSheet(){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context){
        return Wrap(
          children: [
            Filter(),
          ],
        );
      }
    );
  }
}