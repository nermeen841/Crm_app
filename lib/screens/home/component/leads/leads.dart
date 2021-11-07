import 'dart:convert';
import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:crm_app/screens/drawer_screens/customer_managment/component/component.dart';
import 'package:crm_app/screens/drawer_screens/customer_managment/customer_managment_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'add_new_lead.dart';

class LeadsScreen extends StatefulWidget {

  @override
  _LeadsScreenState createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  int _page = 1;

  int _limit = 20;

  bool _hasNextPage = true;

  bool _isFirstLoadRunning = false;

  bool _isLoadMoreRunning = false;

  List _posts = [];

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final  userID = preferences.getString('userID');
    try {
      //{{url}}/clients?user_id=1&client_status=active&page=1
      final res =
      await http.get(Uri.parse(EndPoints.BASE_URL+"/clients?user_id=$userID&page=$_page"));
      var data = json.decode(res.body);
      print(CustomerManagement.filtter);
      setState(() {
        _posts = data['data'];
      });
    } catch (err) {
      print('Something went wrong');
    }
    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final  userID = preferences.getString('userID');
      _page += 1; // Increase _page by 1
      try {
        final res =
        await http.get(Uri.parse(EndPoints.BASE_URL+"/clients?user_id=$userID&page=$_page"));
        var data =  json.decode(res.body);
        final List fetchedPosts = data['data'];
        print(CustomerManagement.filtter);
        if (fetchedPosts.length > 0) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        print('Something went wrong!');
      }
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    //..addListener(_loadMore)
    _controller = new ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (_posts.isNotEmpty)?Scaffold(

      body: _isFirstLoadRunning
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return buildCustomerManagementCard(
                      id: "${_posts[index]['id']}",
                      context: context,
                      email: _posts[index]['email'],
                      cellPhone: _posts[index]['cellphone'],
                      clientName:  _posts[index]['Name'],
                      whatsPhone: _posts[index]['whatsapp'],
                    );
                  },
                  separatorBuilder: (context, index) => myDivider(3),
                  itemCount: _posts.length),
            ),
            if (_isLoadMoreRunning == true)
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 40),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            if (_hasNextPage == false)
              Container( // only(top: 30, bottom: 40)
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                color: Colors.white,
                // child: Center(
                //   child: Text('لقد جلبت كل المحتوى',style: TextStyle(
                //     color: HexColor('#2972B7'),
                //     fontSize: 14,
                //     fontFamily: 'Cairo',
                //     fontWeight: FontWeight.w600,
                //   ),),
                // ),
              ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    ):Container(
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Image.asset('assets/images/20943472 1.png',width: 250,height: 250,),
          SizedBox(
            height: 50,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: defaultButton(
                      radius: 10,
                      width: 200,
                      height: 60,
                      background: HexColor('#2972B7'),
                      function: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddLead())),
                      text: 'اضافة عميل جديد',
                    ))
              ],
      ),
    );
  }
}
