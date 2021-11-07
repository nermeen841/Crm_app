import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/real_estate/add_unit_screen.dart';
import 'package:crm_app/screens/real_estate/component/component.dart';
import 'package:crm_app/screens/real_estate/controller/get_projects_and_units_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllUnitScreen extends StatelessWidget {
  var scafolldKey = GlobalKey<ScaffoldState>();

  // List _list =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Center(
          child: Text(
            'الوحدات',
            style: TextStyle(
                fontFamily: 'Cairo',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () => scafolldKey.currentState!.openDrawer(),
            child: Icon(
              Icons.more_horiz,
              color: Colors.black,
              size: 25,
            )),
        actions: [
          Image.asset(
            'assets/images/avatar3 1.png',
            width: 30,
            height: 30,
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.black)),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: FutureBuilder(
          future: getUnitePerProject(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  primary: true,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 50,
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(

                                      builder: (context) => AddUnit(
                                        projectID: 'None',
                                      )));
                            },
                            child: Text(
                              'اضافة وحدة جديدة',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Cairo',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    myDivider(2),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              buildProjectCardDetails(
                                bathrooms: snapshot.data[index]['bathroom'].toString(),
                                floors: snapshot.data[index]['floor'].toString(),
                                Price: snapshot.data[index]['Price'].toString(),
                                rooms: snapshot.data[index]['rooms'].toString(),
                                spaces: snapshot.data[index]['space'].toString(),
                                notes: snapshot.data[index]['notes'].toString(),
                                type: snapshot.data[index]['type'].toString(),
                                title: snapshot.data[index]['project']['Name'].toString(),
                                titleName: snapshot.data[index]['name'].toString(),
                              ),
                          separatorBuilder: (context, index) => myDivider(1),
                          itemCount: snapshot.data.length),
                    )
                  ]);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
