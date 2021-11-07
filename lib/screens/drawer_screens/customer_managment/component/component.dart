import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/screens/drawer_screens/customer_managment/component/tasks_screen.dart';
import 'package:crm_app/screens/drawer_screens/customer_managment/customer_managment_screen.dart';
import 'package:crm_app/screens/home/component/leads/add_new_lead.dart';
import 'package:crm_app/screens/home/component/leads/components.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../update_client_screen.dart';
import 'add_follow_ up.dart';
import 'customers_manage.dart';

void modalBottomSheetFilterLeadsMenu(context,) {
  List<String> texts = [
    'تصيف بحالة العميل',
    'تصنيف بمصدر العميل',
    'تصنيف بفئة العميل',
    'تصنيف شهري',
    'تصنيف بالمشروع',
  ];

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (builder) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            // height: 330,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),

            child: Padding(
              padding: const EdgeInsets.all(20),
              child: AnimatedPadding(
                padding: MediaQuery.of(context).viewInsets,
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          children: [
                            Text(
                              'أرشيف العملاء',
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor('#2972B7')),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          // primary: true,
                          // shrinkWrap: true,
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {

                                        modalBottomSheetFilterLeadsSecondMenu(context,);

                                         },
                                child: Text(
                                  texts[index],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                              ),
                              myDivider(1),
                            ],
                          ),
                          itemCount: texts.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}

void modalBottomSheetFilterLeadsSecondMenu(context,) {
  List<String> status = [
   'Archive',
   'Active',
   'Cold',
    ];
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (builder) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            // height: 330,
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),

            child: Padding(
              padding: const EdgeInsets.all(20),
              child: AnimatedPadding(
                padding: MediaQuery.of(context).viewInsets,
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Container(
                        // height: 300,
                        child: ListView.builder(
                          primary: true,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: (){
                                  CustomerManagement.filtter = status[index];
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>CustomerManagement()), (route) => false);
                                },
                                child: Text(
                                  status[index],
                                  textAlign: TextAlign.start,
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                              ),
                              myDivider(1),
                            ],
                          ),
                          itemCount: status.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}


Widget buildOptions({
  // String? id,
  required String title,
  required Color color,
})=> Container(
  width: 200,
  height: 40,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color
  ),
  child: Center(
    child: Text(title,style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: 'Cairo'
    ),),
  ),

);


showOptionsDealAlertDialog({context,required String path,required String title, required String id,
  required String clientName,
  required String contactingDateTime,
  required String clientState,
  required String clientReferral,
  required String clientPhoneNum,
  required String clientOtherPhoneNum,
  required String clientWhatsAppPhoneNum,
  required String clientJobTitle,
  required String clientAdderss,
  required String contactingTime,
  required String reviewOfferResponse,
  required String notes,
  required String clientEmail,}) {
  Widget okButton = Container(
    width: 310,
    height: 375,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      // shape: BoxShape.circle
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      child: Column(
        children: [
          InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=>
                  AddFollowUp(
                clientId: id,
                referral: clientReferral,
                email: clientEmail,
                name: clientName,
                phone: clientPhoneNum,
                state: clientState,
              ))),
              child: buildOptions(title: 'متابعة جديدة', color: HexColor('#29B784'))),
          SizedBox(height: 10,),
          InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateClintData(
                          clientId: id,
                          clientEmail: clientEmail,
                          clientAdderss: clientAdderss,
                          clientJobTitle: clientJobTitle,
                          clientName: clientName,
                          clientOtherPhoneNum: clientOtherPhoneNum,
                          clientPhoneNum: clientPhoneNum,
                          clientWhatsAppPhoneNum: clientWhatsAppPhoneNum,
                            )));
                // LeadInformationBottomSheet(context);
              },
              child: buildOptions(
                  title: ' بيانات العميل', color: HexColor('#0085E3'))),
          SizedBox(
            height: 10,
          ),

          InkWell(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=>
                CustomerManageEditing(
                  contactingDateTime: contactingDateTime,
                  contactingTime:contactingTime ,
                  notes: notes,
                  reviewOfferResponse:reviewOfferResponse ,

                  phone: clientPhoneNum,
                  state: clientState,
                  name:clientName,
                  email:clientEmail,
                  referral:clientReferral,
                  clientId:id,
                ))),
            child: buildOptions(
                title: 'سجل المتابعة', color: HexColor('#2972B7')),
          ),
          SizedBox(
            height: 10,
          ),

          InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TasksScreenInDrawer())),
              child: buildOptions(title: 'المهام', color: HexColor('#FFAE48'))),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () => showDoneDealAlertDialog(
                  context: context,
                  title:
                      'هل انت متأكد من إتمام التعاقد ونقل العميل الى العملاء المتعاقدين!',
                  press: () {},
                  path: 'assets/images/icons8-handshake-100 1.png'),
              child: buildOptions(
                  title: 'إتمام التعاقد', color: HexColor('#008000'))),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () => showLoseDealAlertDialog(
                  path: 'assets/images/icons8-trash-200 1.png',
                  press: () {},
                  title:
                      'هل انت متأكد من خسارة التعاقد ونقل العميل الي الارشيف؟',
                  context: context),
              child: buildOptions(
                  title: 'خسارة التعاقد', color: HexColor('#FF0000'))),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );

  AlertDialog alert = AlertDialog(
    actions: [okButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



Widget buildCustomerManagementCard({
  context,
  String? clientName,
  String? clientState,
  String? referral,
  String?  cellPhone,
  String? whatsPhone,
  String? email,
  String? clientJobTitle,
  String? clientAdderss,
  String? clientOtherPhoneNum,
   String? id,
   String? contactingDateTime,
   String? contactingTime,
   String? notes,
   String? reviewOfferResponse,
}) => InkWell(
      onTap: () {
        showOptionsDealAlertDialog(
          reviewOfferResponse : reviewOfferResponse.toString(),
          notes:notes.toString() ,
          contactingTime:contactingTime.toString() ,
          contactingDateTime: contactingDateTime.toString(),
          clientState: clientState.toString(),
          clientReferral: referral.toString(),
          context: context,
          title: 'هل أنت متأكد من خسارة التعاقد ونقل العميل الي الأرشيف!',
          path: 'assets/images/icons8-trash-200 1.png',
          id: id.toString(),
          clientJobTitle: clientJobTitle.toString(),
          clientName: clientName.toString(),
          clientAdderss: clientAdderss.toString(),
          clientEmail: email.toString(),
          clientOtherPhoneNum: clientOtherPhoneNum.toString(),
          clientPhoneNum: cellPhone.toString(),
          clientWhatsAppPhoneNum: whatsPhone.toString(),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        height: 106,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 70,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      'A',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // SizedBox(height: 20,),
                        Text(
                          '$clientName',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Cairo',
                              color: Colors.black),
                        ),
                        SizedBox(width: 20,),
                        InkWell(
                          onTap: ()=> launch('tel: $cellPhone'),
                          child: Text(
                            ' $cellPhone',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Cairo',
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        (email != null)?
                        Text(
                          '$email',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: HexColor('#333333')),
                        ):Container(),
                         SizedBox(
                          width: 10,
                        ),
                        (whatsPhone != null)? InkWell(
                          // onTap: (){
                          //
                          // },
                          onTap: () async {
                            var whatsappUrl = "https://api.whatsapp.com/send?phone=+2$whatsPhone";
                            await canLaunch(whatsappUrl) != null
                            ? launch(whatsappUrl) :
                            print("open WhatsApp app link or do a snackbar withnotification that there is no WhatsApp installed");
                          },
                          child: Text(
                            '$whatsPhone',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: HexColor('#333333')),
                          ),
                        ) : Container()
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        (referral != null)?
                        Container(
                          height: 30,
                          width: 93,
                          color: HexColor('#DDEFFF'),
                          child: Center(
                              child: Text(
                                referral.toString(),
                                textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Cairo',
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          )),
                        ):Container(),
                        SizedBox(
                          width: 10,
                        ),
                        (clientState != null)?
                        Container(
                          height: 30,
                          width: 50,
                          color: HexColor('#8AB6D6'),
                          child: Center(
                              child: Text(
                            '$clientState',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Cairo',
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          )),
                        ): Container(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );


showLoseDealAlertDialog({context,required VoidCallback press,required String path,required String title}) {
  Widget okButton = Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          path,
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      ),
      Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          )),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
                width: 90,
                height: 35,
                decoration: BoxDecoration(
                    color: HexColor('#E6E6E6'),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: InkWell(
                        onTap: press,
                        child: Text(
                          'تأكيد',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )))),
            Spacer(),
            Container(
                width: 90,
                height: 35,
                decoration: BoxDecoration(
                    color: HexColor('#C50B0B'),
                    borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                      child: Text(
                        'الغاء',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                )),
          ],
        ),
      ),
    ],
  );

  AlertDialog alert = AlertDialog(
    actions: [okButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showDoneDealAlertDialog({context,required VoidCallback press,required String path,required String title}) {
  Widget okButton = Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          path,
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      ),
      Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          )),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
                width: 90,
                height: 35,
                decoration: BoxDecoration(
                    color: HexColor('#E6E6E6'),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: InkWell(
                        onTap: press,
                        child: Text(
                          'تأكيد',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )))),
            Spacer(),
            Container(
                width: 90,
                height: 35,
                decoration: BoxDecoration(
                    color: HexColor('#C50B0B'),
                    borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                      child: Text(
                        'الغاء',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                )),
          ],
        ),
      ),
    ],
  );

  AlertDialog alert = AlertDialog(
    actions: [okButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//
// Widget buildCustomerManagementArchivedCard() => Container(
//       padding: EdgeInsets.symmetric(horizontal: 14),
//       height: 106,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 height: 70,
//                 width: 35,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.green,
//                 ),
//                 child: Center(
//                   child: Text(
//                     'A',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Cairo',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'علاء عاشور - 01001944985',
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         fontFamily: 'Cairo',
//                         color: Colors.black),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'alaaashour667@gmail.com',
//                         style: TextStyle(
//                             fontFamily: 'Cairo',
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14,
//                             color: HexColor('#333333')),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         '0122556902958',
//                         style: TextStyle(
//                             fontFamily: 'Cairo',
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14,
//                             color: HexColor('#333333')),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         height: 30,
//                         width: 93,
//                         color: HexColor('#DDEFFF'),
//                         child: Center(
//                             child: Text(
//                           'سوشيال ميديا',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontFamily: 'Cairo',
//                             color: Colors.black,
//                             fontSize: 12,
//                           ),
//                         )),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Container(
//                         height: 30,
//                         width: 50,
//                         color: HexColor('#8AB6D6'),
//                         child: Center(
//                             child: Text(
//                           'Lead',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontFamily: 'Cairo',
//                             color: Colors.black,
//                             fontSize: 12,
//                           ),
//                         )),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );


// void LeadInformationBottomSheet(context,){
//
//
//   TextEditingController name = TextEditingController();
//
//   TextEditingController phoneNum = TextEditingController();
//
//   TextEditingController otherPhoneNum = TextEditingController();
//
//   TextEditingController whatsAppPhoneNum = TextEditingController();
//
//   TextEditingController jobTitle = TextEditingController();
//
//   TextEditingController adderss = TextEditingController();
//
//   TextEditingController email = TextEditingController();
//
//
//   var formKey = GlobalKey<FormState>();
//   showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:  Radius.circular(15))),
//       builder: (context){
//         return Directionality(
//           textDirection: TextDirection.rtl,
//           child: Container(
//             height: MediaQuery.of(context).size.height*0.9,
//             child: ListView(
//               shrinkWrap: true,
//               primary: true,
//               physics: BouncingScrollPhysics(),
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//               children: [
//                 Form(
//                   key: formKey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Text("الاسم *",style: TextStyle(
//                             fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
//                         ),),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         leadTextfield(type: TextInputType.text, txt: 'علي السيد',height: 50,),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text("رقم الهاتف *",style: TextStyle(
//                             fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
//                         ),),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         leadTextfield(type: TextInputType.phone, txt: '01022952483',height: 50),
//
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text("رقم هاتف اخر ",style: TextStyle(
//                             fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
//                         ),),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         leadTextfield(type: TextInputType.phone, txt: '01228506759',height: 50),
//                         SizedBox(
//                           height: 10,
//                         ),
//
//                         Text("العنوان ",style: TextStyle(
//                             fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
//                         ),),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         leadTextfield(type: TextInputType.streetAddress, txt: 'توريل الجيدة',height: 50),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text("البريد الإلكتروني *",style: TextStyle(
//                             fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
//                         ),),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         leadTextfield(type: TextInputType.emailAddress, txt: 'ibrahimamin081@gamil.com',height: 50),
//                         SizedBox(height:10),
//                         Row(
//                           children: [
//                             DropDown(txt: 'فئه العميل',),
//                             Spacer(),
//                             DropDown(txt: 'حاله العميل',),
//                           ],
//                         ),
//                         DropDownLead(),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         leadTextfield(type: TextInputType.text, txt: 'ملاحظات',height: 100),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: InkWell(
//                             onTap: () {
//                               showSuccessAlertDialog(path: 'assets/images/99 1.png',context: context,title: 'تم إضافة المهمة بنجاح',press: (){});
//                             },
//                             child: Container(
//                               width: 40,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 color: HexColor('#2972B7'),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Icon(
//                                 Icons.arrow_forward_outlined,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       }
//   );
// }
