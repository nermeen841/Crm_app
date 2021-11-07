import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/onBoarding/body.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Image.asset('assets/images/4867780 1.png',width: 250,height: 250,),
          SizedBox(
            height: 50,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: defaultButton(radius: 10, width: 296, height: 60, background: HexColor('#2972B7'), function:(){}, text: 'اضافة مهمه جديدة'))
        ],
      ),
    );
  }
}
