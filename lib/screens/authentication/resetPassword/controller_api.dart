import 'dart:convert';
import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:crm_app/screens/authentication/forgetPassword/body.dart';
import 'package:crm_app/screens/authentication/forgetPassword/forgetPasswordScreen.dart';
import 'package:crm_app/screens/authentication/resetPassword/resetPasswordScreen.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:crm_app/screens/send_code/pin_code_for_resetPassword.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


sendResetPass({required String phone, context}) async{
  try{
    Map<String, String> body = {
      'phone' : phone,
    };
    var response  = await http.post(Uri.parse(EndPoints.BASE_URL+"/PasswordReset"), body: body);
    var data = json.decode(response.body);
    if(data["status"] == "success" && phone != ""){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> PinCodeResetPasswordVerificationScreen(phoneNumber: ForgetPasswordBody.phoneController!.text.toString(), verificationId: ForgetPasswordBody.ID,)));
    }
    // else if(email == ""){
    //   showAlertDialog(context: context, title: data["message"].toString());
    // }

    // else if(pass == ""){
    //   showAlertDialog(context: context, title: data["errorArr"]['password'][0].toString());
    // }

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




