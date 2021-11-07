import 'dart:convert';
import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../customers_manage.dart';

addFollowUp({
  required String ClientID,
  required String contactingType,
  required String contactingDateTime,
  required String nextContactingDateTime,
  context,
}) async {

  SharedPreferences preferences = await SharedPreferences.getInstance();
  final  userID = preferences.getString('userID');
  try{
    Map<String, String> body = {
      'ClientID':ClientID,
      'UID' : '$userID',
      'contactingType':contactingType,
      'contactingDateTime':contactingDateTime,
      'nextContactingDateTime':nextContactingDateTime,
    };
    // print("user login id --------------- ${userID.toString()}");
    var response = await http.post(
      //{{url}}/StoreFollowUp?ClientID=47&UID=1&contactingType=interested&contactingDateTime=12/30/2021&contactingTime=01:15 pm&nextContactingDateTime
        Uri.parse(EndPoints.BASE_URL +
            "/StoreFollowUp?ClientID=47&UID=1&contactingType=interested&contactingDateTime=30/12/2021&nextContactingDateTime"),
        body: body);
    var data = json.decode(response.body);
    AppCubit.get(context).changeAddLeaded();
    if(data["status"] == "success"){
      AppCubit.get(context).changeAddLeaded();
      Navigator.push(context, MaterialPageRoute(builder: (context)=> CrmAppLayout(index: 0,)));
      showSuccessAlertDialog(context: context,title: data['message'].toString(),path: 'assets/images/99 1.png',press: (){});
      // showAlertDialog(context: context,title: data['message'].toString());
    }
    else{
      if(ClientID == ''){
        showAlertDialog(context: context, title: data["data"][0]['ClientID'][0].toString());
      }
      else if(contactingType == '')
      {
        showAlertDialog(context: context, title: data["data"][0]['contactingType'][0].toString());
        // showAlertDialog(context: context, title: data["data"]['Name'][0].toString());
      }
      else if(contactingDateTime == '')
      {
        showAlertDialog(context: context, title: data["data"][0]['contactingDateTime'][0].toString());

      }
      else {
        showAlertDialog(context: context, title: data["message"].toString());
      }
    }
  }catch(error){
    // showAlertDialog(context: context, title: error.toString());
    print("user login errror --------------- ${error.toString()}");
  }
}
showAlertDialog({required title, context}){
  AlertDialog alert = AlertDialog(
    title: Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: InkWell(
                onTap: ()=>Navigator.pop(context),
                child: Icon(Icons.close_outlined))),
        SizedBox(height: 25,),
        Center(child: Text(title)),
      ],
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
