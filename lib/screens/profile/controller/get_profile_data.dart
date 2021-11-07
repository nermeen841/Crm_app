import 'dart:convert';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

getProfileData() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final  userID = preferences.getString('userID');
  try{
    var response  = await http.get(Uri.parse(EndPoints.BASE_URL+"/MyAccount/$userID"));
    var data = json.decode(response.body);
    return data["data"];
  }catch(error){
    // showAlertDialog(context: context, title: error.toString());
    print("user data errror --------------- ${error.toString()}");
  }
}
// {{url}}/HomeFollowUps?user_id=1&date=late&status=Done

