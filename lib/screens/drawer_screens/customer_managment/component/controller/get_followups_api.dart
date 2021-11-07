import 'dart:convert';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

getFollowUps(context,String clientID) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final  userID = preferences.getString('userID');
  try{
    //{{url}}/clients?user_id=1&client_status=active&page=1
    // {{url}}/FollowUps?user_id=1&ClientID=
    var response  = await http.get(Uri.parse(EndPoints.BASE_URL+"/FollowUps?user_id=$userID&ClientID=$clientID"));
    var data = json.decode(response.body);
    if( data["status"] == "success"){
      print("follow upata ------------------------------------------------------- : ${data['data']}");
      print("clientID ------------------------------------------------------- : ${clientID}");
      return data['data'];
      // print('delet ------------------- $clientID');
      // showSuccessAlertDialog(path: 'assets/images/99 1.png',context: context,title: data['message'].toString(),press: (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>CrmAppLayout()));
      // },);
    }
  }catch(error){
    // showAlertDialog(context: context, title: error.toString());
    print("user data errror --------------- ${error.toString()}");

  }
}

showSuccessAlertDialog({context, VoidCallback? press,required String path,required String title}) {
  Widget okButton = InkWell(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Image.asset(
              path,
              width: 220,
              height: 220,
            ),
          ),
        ),
        Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 20,
        ),
      ],
    ),
    onTap: press,
  );

  AlertDialog alert = AlertDialog(
    actions: [okButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
