import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/home/component/leads/components.dart';
import 'package:crm_app/screens/home/component/leads/controller/api_genral_info.dart';
import 'package:crm_app/screens/home/component/leads/controller/api_update_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateClintData extends StatelessWidget {

  final String clientId;
  final String clientName;
  final String clientPhoneNum;
  final String clientOtherPhoneNum;
  final String clientWhatsAppPhoneNum;
  final String clientJobTitle;
  final String clientAdderss;
  final String clientEmail;

  UpdateClintData(
      {Key? key,
      required this.clientId,
      required this.clientName,
      required this.clientPhoneNum,
      required this.clientOtherPhoneNum,
      required this.clientWhatsAppPhoneNum,
      required this.clientJobTitle,
      required this.clientAdderss,
      required this.clientEmail})
      : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    TextEditingController name = TextEditingController(text: (clientName != 'null')?clientName.toString():"");

    TextEditingController phoneNum = TextEditingController(text: (clientPhoneNum != 'null')?clientPhoneNum.toString():"");

    TextEditingController otherPhoneNum = TextEditingController(text: (clientOtherPhoneNum != 'null')?clientOtherPhoneNum.toString():"");

    TextEditingController whatsAppPhoneNum = TextEditingController(text: (clientWhatsAppPhoneNum != 'null')?clientWhatsAppPhoneNum.toString():"");

    TextEditingController jobTitle = TextEditingController(text: (clientJobTitle != 'null')?clientJobTitle.toString():"");

    TextEditingController adderss = TextEditingController(text: (clientAdderss != 'null')?clientAdderss.toString():"");

    TextEditingController email = TextEditingController(text: (clientEmail != 'null')?clientEmail .toString():"");


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor:Colors.white,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
                height: MediaQuery.of(context).size.height*0.9,
                child: ListView(
                  shrinkWrap: true,
                  primary: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  children: [
                    Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("الاسم *",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                            ),),
                            SizedBox(
                              height: 2,
                            ),
                            leadTextfieldEdite(type: TextInputType.text, txt: 'علي السيد',height: 50,controller: name),
                            SizedBox(
                              height: 10,
                            ),
                            Text("رقم الهاتف *",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                            ),),
                            SizedBox(
                              height: 2,
                            ),
                            leadTextfieldEdite(type: TextInputType.phone, txt: '01022952483',height: 50,controller: phoneNum),
                            SizedBox(
                              height: 10,
                            ),
                            Text("رقم WatsApp",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                            ),),
                            SizedBox(
                              height: 2,
                            ),
                            leadTextfieldEdite(type: TextInputType.phone, controller: whatsAppPhoneNum,height: 50, txt: ''),
                            Text("رقم هاتف اخر ",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                            ),),
                            SizedBox(
                              height: 2,
                            ),
                            leadTextfieldEdite(type: TextInputType.phone, txt: '01228506759',height: 50,controller: otherPhoneNum),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Job Title",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                            ),),
                            SizedBox(
                              height: 5,
                            ),
                            leadTextfieldEdite(type: TextInputType.text, controller: jobTitle,height: 50,),
                            Text("العنوان ",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                            ),),
                            SizedBox(
                              height: 2,
                            ),
                            leadTextfieldEdite(controller: adderss,type: TextInputType.streetAddress,height: 50),
                            SizedBox(
                              height: 10,
                            ),
                            Text("البريد الإلكتروني *",style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                            ),),
                            SizedBox(
                              height: 2,
                            ),
                            leadTextfieldEdite(type: TextInputType.emailAddress, txt: 'ibrahimamin081@gamil.com',height: 50,controller: email),
                            SizedBox(height:10),
                            // Container(
                            //   height: 111,
                            //   // color: Colors.red,
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //      ],
                            //   ),
                            // ),
                            DropDown(txt: 'حالة العميل',id: clientId.toString(),),
                            DropDownClass(txt: 'فئه العميل',id:clientId.toString() ,),
                            DropDownRefferal(txt: 'مصدر العميل',id: clientId.toString()),

                            SizedBox(
                              height: 15,
                            ),
                            leadTextfieldEdite(type: TextInputType.text, txt: 'ملاحظات',height: 100,),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  print('client data ------------------------------------ : ${name.text}... ${phoneNum.text}');
                                  updateClient(
                                    clientId: clientId.toString(),
                                    context: context,
                                    status: 'cold',
                                    // uID: '1',
                                    email: email.text.toString(),
                                    phone: otherPhoneNum.text.toString(),
                                    cellphone: phoneNum.text.toString(),
                                    whatsapp: whatsAppPhoneNum.text.toString(),
                                    name: name.text.toString(),
                                    job: jobTitle.text.toString(),
                                    address: adderss.text.toString(),
                                    referral: 'facebook',
                                  );
                                  // showSuccessAlertDialog(path: 'assets/images/99 1.png',context: context,title: 'تم إضافة المهمة بنجاح',press: (){});
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: HexColor('#2972B7'),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],



        ),
      ),
    ));
  }

  leadTextfieldEdite({required TextInputType type, TextEditingController? controller,  double? height, String? title,String? txt}) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric( horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: HexColor("#E6E6E6")
      ),
      child: TextFormField(
//         onChanged:(val){
//           setState(() {
//               title = val;
//           });
//         } ,
// onFieldSubmitted: (val){
//           setState(() {
//             title = val;
//           });
// },
//         initialValue: txt,
        // maxLines: lines,
        controller: controller,
        textDirection: TextDirection.rtl,
        keyboardType: type,
        // controller: controller,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Cairo',
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintText: '',
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

}
