import 'dart:convert';
import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

addUnit({
  String? space,
  // required String CityID,
   String? notes,
   String? kitchen,
  required String type,
  required String name,
   String? ProjectID,
  String?  ClientID,
  String?  CityID,
   String? floor,
   String? address,
  // required String userId,
   String? rooms,
   String? bathroom,
   String? price,
  // required String projectID,
  context,
}) async {SharedPreferences preferences = await SharedPreferences.getInstance();
  final  userID = preferences.getString('userID');
  // final  CityID = preferences.getString('CityID');
print('---------------------------- $userID');
  try{
    Map<String, String> body = {
      'CityID':'$CityID',
      'user_id' : '$userID',
      'name' : '$name',
      'type' : '$type',
      'address' : '$address',
      'space': '$space',
      'floor': '$floor',
      'rooms': '$rooms',
      'bathroom': '$bathroom',
      'Kitchen': '$kitchen',
      'notes': '$notes',
      'ClientID':'$ClientID',
      'Price': '$price',
      'ProjectID' : '$ProjectID',
    };
    // print("user login id --------------- ${userID.toString()}");
    var response  = await http.post(Uri.parse(EndPoints.BASE_URL+"/addUnit"), body: body);
    var data = json.decode(response.body);
    AppCubit.get(context).changeAddLeaded();
    if(data["status"] == "success"){
      AppCubit.get(context).changeAddLeaded();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CrmAppLayout(index: 0,)));
      showSuccessAlertDialog(path: 'assets/images/99 1.png',context: context,title: data['message'].toString(),press: (){});
    }
    else{
       if(type == '')
      {
        showAlertDialog(context: context, title: data["data"][0]['type'][0].toString());
        // showAlertDialog(context: context, title: data["data"]['Name'][0].toString());
      }
      else if(name == '')
      {
        showAlertDialog(context: context, title: data["data"][0]['Name'][0].toString());
      }else {
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
