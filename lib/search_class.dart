
import 'dart:convert';
import 'package:crm_app/screens/real_estate/controller/get_projects_and_units_api.dart';
import 'package:flutter/material.dart';


class ProjectUnitSearch extends SearchDelegate {
  ProjectUnitSearch() : super(
      searchFieldLabel: 'البحث',
            searchFieldStyle: TextStyle(
                color: Colors.grey, fontSize: 18, fontFamily: 'Cairo'));



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
         close(context, null);

        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? Container()
        : ListView.builder(
      itemCount: 10,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text("units"),
          onTap: (){

          },
        );
      },
    );

    // FutureBuilder(
    //         future: getSearchData(keyword: query.toString()),
    //         builder: (context, AsyncSnapshot snapshot) {
    //           if (snapshot.hasData) {
    //             return ListView.builder(
    //               itemCount: snapshot.data["Books"].length,
    //               itemBuilder: (context, i) {
    //                 return ListTile(
    //                   title: Text("units"),
    //                   onTap: () {},
    //                 );
    //               },
    //             );
    //           } else {
    //             return Container(
    //               child: Center(
    //                 child: Text(
    //                   "لا يوجد بيانات للبحث",
    //                   style: TextStyle(
    //                       fontSize: 16,
    //                       color: HexColor("#AB0D03"),
    //                       fontWeight: FontWeight.w600),
    //                 ),
    //               ),
    //             );
    //           }
    //         });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Container()
        :ListView.builder(
      itemCount: 10,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text("unitsssss"),
          onTap: (){

          },
        );
      },
    );
    // FutureBuilder(
    //         future: getSearchData(keyword: query.toString()),
    //         builder: (context, AsyncSnapshot snapshot) {
    //           if (snapshot.hasData) {
    //             return ListView.builder(
    //               itemCount: snapshot.data["Books"].length,
    //               itemBuilder: (context, i) {
    //                 return ListTile(
    //                   title: Text("${snapshot.data["Books"][i]["title"]}"),
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => BookDetail(
    //                                   bookSize:
    //                                       "${snapshot.data["Books"][i]["size"]}",
    //                                   bookID:
    //                                       "${snapshot.data["Books"][i]["id"]}",
    //                                   shareLink:
    //                                       "${snapshot.data["Books"][i]["sharingLink"]}",
    //                                   image:
    //                                       "${snapshot.data["Books"][i]["writer"]["photo"]}",
    //                                   writerId:
    //                                       "${snapshot.data["Books"][i]["writer"]["id"]}",
    //                                   bookTitle:
    //                                       "${snapshot.data["Books"][i]["title"]}",
    //                                   bbokimage:
    //                                       "${snapshot.data["Books"][i]["thumbnail"]}",
    //                                   linkPdf:
    //                                       "${snapshot.data["Books"][i]["BookPDF"]}",
    //                                   desc:
    //                                       "${snapshot.data["Books"][i]["details"]}",
    //                                   writerName:
    //                                       "${snapshot.data["Books"][i]["writer"]["name"]}",
    //                                 )));
    //                   },
    //                 );
    //               },
    //             );
    //           } else {
    //             return Container(
    //               child: Center(
    //                 child: Text(
    //                   "لا يوجد بيانات للبحث",
    //                   style: TextStyle(
    //                       fontSize: 16,
    //                       color: HexColor("#AB0D03"),
    //                       fontWeight: FontWeight.w600),
    //                 ),
    //               ),
    //             );
    //           }
    //         });
  }
}
