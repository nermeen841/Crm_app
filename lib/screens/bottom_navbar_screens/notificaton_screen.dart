import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/drawer_screens/notifications/notifications_found.dart';
import 'package:crm_app/screens/drawer_screens/services/services_screen.dart';
import 'package:crm_app/screens/onBoarding/body.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Center(
          child: Text('الإشعارات', style: TextStyle(
            fontFamily: 'Cairo',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15
          ),),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){

          },
            child: Icon(Icons.more_horiz,color: Colors.black,size: 25,)),
        actions: [
          Image.asset('assets/images/avatar3 1.png',width: 30,height: 30,),
          SizedBox(
            width: 10,
          ),
          ],
      ),
      body: Center(
        child: ListView(
          primary: true,
          shrinkWrap: true,
          children: [
            Image.asset('assets/images/undraw_Notify_re_65on 1.png',width: 242,height: 180,),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text('لا يوجد إشعارات حتى الآن',style: TextStyle(
                fontSize: 14,fontWeight: FontWeight.bold,fontFamily: 'Cairo',color: Colors.black
              ),),
            )
          ],
        ),
      ),
    );
  }
}
