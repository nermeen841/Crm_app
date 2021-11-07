import 'dart:convert';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:http/http.dart' as http;
import 'api_delete_client.dart';

changeClientState({
  required String status,
  context,
  required String clientID,
}) async {
  try{
    Map<String, String> body = {
      'status' : "$status",
    };
    var response  = await http.post(Uri.parse(EndPoints.BASE_URL+"/UpdateClientStatus/$clientID"), body: body);
    var data = json.decode(response.body);
    if(data["status"] == "success"){
      // Navigator.pop(context);
      showSuccessAlertDialog(path: 'assets/images/99 1.png',context: context,title: data['message'].toString(),press: (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>CrmAppLayout()));
      });
      print('yesssssssssssssssssssssssssssssssss');
    }
    // else{
    //   if(cellphone == ''){
    //     showAlertDialog(context: context, title: data["data"][0]['cellphone'][0].toString());
    //   }else if(whatsapp == '')
    //   {
    //     showAlertDialog(context: context, title: data["data"][0]['whatsapp'][0].toString());
    //     // showAlertDialog(context: context, title: data["data"]['Name'][0].toString());
    //   }
    //   else if(name == '')
    //   {
    //     showAlertDialog(context: context, title: data["data"][0]['Name'][0].toString());
    //   }else {
    //     showAlertDialog(context: context, title: data["message"].toString());
    //   }
    // }
  }catch(error){
    // showAlertDialog(context: context, title: error.toString());
    print("errror --------------- ${error.toString()}");
  }
}
