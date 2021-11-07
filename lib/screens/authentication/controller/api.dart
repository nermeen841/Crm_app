import 'dart:convert';
import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:crm_app/screens/authentication/signIn/body.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:crm_app/screens/send_code/pin_code_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// {{url}}/Login?email=Mohamed Sultan&password=123456&deviceToken

sendUserData({required String email, required String pass, context}) async
{
  print(
    'send user data');
  try{
    var response  = await http.post(Uri.parse(EndPoints.BASE_URL+"/Login?email=$email&password=$pass&deviceToken"),);
    print('user data = $response');

    var data = json.decode(response.body);
    AppCubit.get(context).changeSignIn();
    if(data["status"] == "success"){
      AppCubit.get(context).changeSignIn();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('login', true);
      preferences.setString('userID', data['data']["userDetails"]['id'].toString());
      Navigator.push(context, MaterialPageRoute(builder: (context)=> PinCodeVerificationScreen(phoneNumber: SignInBody.phoneController!.text.toString(), verificationId: SignInBody.ID, )));
    
    }

    else if(email == ""){
      showAlertDialog(context: context, title: data["errorArr"]['email'][0].toString());
    }

    else if(pass == ""){
      showAlertDialog(context: context, title: data["errorArr"]['password'][0].toString());
    }

    else {
      showAlertDialog(context: context, title: data["message"].toString());
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




