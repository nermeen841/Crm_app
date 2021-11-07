import 'dart:convert';
import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

updateClient({
  required String email,
  required String phone,
  required String cellphone,
  required String whatsapp,
  required String name,
  required String job,
  required String address,
  // required String uID,
  required String status,
  required String referral,
  required String clientId,
  context,
}) async {

  SharedPreferences preferences = await SharedPreferences.getInstance();
  final  userID = preferences.getString('userID');
  try{
    Map<String, String> body = {
      'email' : "$email",
      'Job' : "$job",
      'cellphone' : "$cellphone",
      'whatsapp' : "$whatsapp",
      'address' : '$address',
      'Name' : '$name',
      'phone' : '$phone',
      'referral' : '$referral',
      'UID' : '${userID.toString()}',
      'status' : '$status',
    };
    print("user login id --------------- ${clientId.toString()}");
    var response  = await http.post(Uri.parse(EndPoints.BASE_URL+"/UpdateClient/$clientId"), body: body);
    var data = json.decode(response.body);
    if(data["status"] == "success"){
      // Navigator.pop(context);
      showSuccessAlertDialog(path: 'assets/images/99 1.png',context: context,title: 'تم إضافة المهمة بنجاح',press: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CrmAppLayout(index: 0,)));
      });
    }
    else{
      if(cellphone == ''){
        showAlertDialog(context: context, title: data["data"][0]['cellphone'][0].toString());
      }else if(whatsapp == '')
      {
        showAlertDialog(context: context, title: data["data"][0]['whatsapp'][0].toString());
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
