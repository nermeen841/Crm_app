import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:crm_app/screens/onBoarding/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton:
      Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: HexColor('#FFAE48'),
            shape: BoxShape.circle
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),),
      appBar:
      AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.more_horiz,color: Colors.black,size: 25,),
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
      )
      ,
      body:Directionality(
        textDirection: TextDirection.rtl,
        child: buildDetailsTaskScreen(),
      ),
    );
  }
}















