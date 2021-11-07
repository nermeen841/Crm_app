// import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components.dart';
import 'controller/api_add_client.dart';

class AddLead extends StatefulWidget {
  @override
  _AddLeadState createState() => _AddLeadState();
}

class _AddLeadState extends State<AddLead> {
  var formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController phoneNum = TextEditingController();

  TextEditingController otherPhoneNum = TextEditingController();

  TextEditingController whatsAppPhoneNum = TextEditingController();

  TextEditingController jobTitle = TextEditingController();

  TextEditingController adderss = TextEditingController();

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            children: [
              Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("اضافة عميل جديد",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("الاسم *",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 2,
                      ),
                      leadTextfield(type: TextInputType.text, controller:name ,height: 50,),
                      SizedBox(
                        height: 10,
                      ),
                      Text("رقم الهاتف *",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 2,
                      ),
                      leadTextfield(type: TextInputType.phone, controller: phoneNum,height: 50,),
                      SizedBox(
                        height: 10,
                      ),
                      Text("رقم الوتس أب *",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 2,
                      ),
                      leadTextfield(type: TextInputType.phone, controller: whatsAppPhoneNum,height: 50),
                      SizedBox(
                        height: 10,
                      ),
                      Text("رقم هاتف اخر ",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 5,
                      ),
                      leadTextfield(type: TextInputType.phone, controller: otherPhoneNum,height: 50,),
                      Text("المسمى الوظيفي",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 5,
                      ),
                      leadTextfield(type: TextInputType.text, controller: jobTitle,height: 50,),
                      SizedBox(
                        height: 10,
                      ),
                      Text("العنوان ",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 2,
                      ),
                      leadTextfield(type: TextInputType.streetAddress, controller: adderss,height: 50,),
                      SizedBox(
                        height: 10,
                      ),
                      Text("البريد الإلكتروني ",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 2,
                      ),
                      leadTextfield(type: TextInputType.emailAddress, controller: email,height: 50,),
                      SizedBox(height:10),

                      DropDown(txt: 'حالة العميل',id: '',),

                      DropDownClass(txt: 'فئة العميل',id: ''),

                      DropDownRefferal(txt: 'مصدر العميل',id: '',),

                      Text(" الملاحظات",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      leadTextfield(type: TextInputType.text, txt: 'ملاحظات',height: 100),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: (AppCubit.get(context).isAddLeaded)?Container(child: Center(child: CircularProgressIndicator(),),):
                        BlocConsumer<AppCubit, AppStates>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return AppCubit.get(context).isAddLeaded ? CircularProgressIndicator() :
                                  InkWell(
                                          onTap: () {
                                            AppCubit.get(context).changeAddLeaded();
                                            // print('client data ------------------------------------ : ${name.text}... ${phoneNum.text}');
                                            addClient(
                                                context: context,
                                                status: 'archive',
                                                // uID: '1',
                                                email: email.text.toString(),
                                                phone: otherPhoneNum.text.toString(),
                                                cellphone: phoneNum.text.toString(),
                                                whatsapp: whatsAppPhoneNum.text.toString(),
                                                name: name.text.toString(),
                                                job: jobTitle.text.toString(),
                                                address: adderss.text.toString(),
                                                referral: 'facebook');
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
                                        );

                                },
                                // child: InkWell(
                                //   onTap: () {
                                //    // print('client data ------------------------------------ : ${name.text}... ${phoneNum.text}');
                                //     addClient(
                                //         context: context,
                                //         status: 'archive',
                                //         // uID: '1',
                                //         email: email.text.toString(),
                                //         phone: otherPhoneNum.text.toString(),
                                //         cellphone: phoneNum.text.toString(),
                                //         whatsapp: whatsAppPhoneNum.text.toString(),
                                //         name: name.text.toString(),
                                //         job: jobTitle.text.toString(),
                                //         address: adderss.text.toString(),
                                //         referral: 'facebook');
                                //     },
                                //   child: Container(
                                //     width: 40,
                                //     height: 40,
                                //     decoration: BoxDecoration(
                                //       color: HexColor('#2972B7'),
                                //       shape: BoxShape.circle,
                                //     ),
                                //     child: Icon(
                                //       Icons.arrow_forward_outlined,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
                              ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  leadTextfield({required TextInputType type, TextEditingController? controller,  double? height, String? title,String? txt}) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric( horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: HexColor("#E6E6E6")
      ),
      child: TextFormField(
        initialValue: txt,
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
