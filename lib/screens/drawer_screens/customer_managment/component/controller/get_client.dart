import 'dart:convert';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

getClient() async{

  try{
    var response  = await http.get(Uri.parse(EndPoints.BASE_URL+"/clients"));
    var data = json.decode(response.body);
    return data["data"];
  }catch(error){
    // showAlertDialog(context: context, title: error.toString());
    print("user data errror --------------- ${error.toString()}");
  }
}
