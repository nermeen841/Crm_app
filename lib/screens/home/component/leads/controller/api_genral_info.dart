import 'dart:convert';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


getGeneralInfo() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final  userID = preferences.getString('userID');
  try{
    // {{url}}/HomeFollowUps?user_id=1&date=late&status=Done
    var response  = await http.get(Uri.parse(EndPoints.BASE_URL+"/GeneralInfo"));
    var data = json.decode(response.body);
    // print('----------------------------${response.body}');
    return data['data'];
  }catch(error){
    print("user data errror --------------- ${error.toString()}");
  }
}

/*    var response  = await http.post(Uri.parse(EndPoints.BASE_URL+"/UpdateMyAccount/1"), body: body);
    var data = json.decode(response.body);
    if(data["status"] == "success"){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CrmAppLayout(index: 0,)));
    }
    else {
      showAlertDialog(context: context, title: data["message"].toString());
    }
*/