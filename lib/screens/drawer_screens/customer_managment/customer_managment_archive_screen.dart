
import 'package:crm_app/componnent/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'component/component.dart';
import 'component/controller/api_delete_client.dart';

class CustomerManagementArchive extends StatefulWidget {

  final String clientID;

  static List<Widget> cards = [];

  const CustomerManagementArchive({Key? key,required this.clientID}) : super(key: key);

  @override
  _CustomerManagementArchiveState createState() => _CustomerManagementArchiveState();
}

class _CustomerManagementArchiveState extends State<CustomerManagementArchive> {
  var searchController = TextEditingController();
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = false;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.Up;
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];
  var scafolldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    // showAlertDialog(BuildContext context) {
    //   Widget okButton =  Column(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    //           child: Image.asset('assets/images/icons8-delete-200 1.png',width: 150,height: 150,),
    //         ),
    //       ),
    //       Text(
    //         'تأكيد الحذف',
    //         textAlign: TextAlign.center,
    //         style: TextStyle(fontFamily: 'Cairo',fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    //         child: Row(
    //           textDirection: TextDirection.rtl,
    //           children: [
    //             Container(
    //                 width: 90,
    //                 height: 40,
    //                 decoration: BoxDecoration(
    //                     color: HexColor('#E6E6E6'),
    //                     borderRadius: BorderRadius.circular(5)
    //                 ),
    //                 child: Center(child: InkWell(
    //                     onTap: (){
    //                       Navigator.pop(context);
    //                     },
    //                     child: Center(
    //                       child: Text(
    //                         'تأكيد',
    //                         style: TextStyle(
    //                             fontFamily: 'Cairo',
    //                             fontSize: 15,
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.bold),
    //                       ),
    //                     )))),
    //             Spacer(),
    //             Container(
    //                 width: 90,
    //                 height: 40,
    //                 decoration: BoxDecoration(
    //                     color: HexColor('#C50B0B'),
    //                     borderRadius: BorderRadius.circular(5)
    //                 ),
    //                 child: InkWell(
    //                   onTap: (){
    //                     Navigator.pop(context);
    //                   },
    //                   child: Center(
    //                       child: Text(
    //                         'الغاء',
    //                         style: TextStyle(
    //                             fontFamily: 'Cairo',
    //                             fontSize: 15,
    //                             color: Colors.white,
    //                             fontWeight: FontWeight.bold),
    //                       )),
    //                 )),
    //           ],
    //         ),
    //       ),
    //     ],
    //   );
    //
    //   AlertDialog alert = AlertDialog(
    //     actions: [
    //       okButton
    //     ],
    //   );
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return alert;
    //     },
    //   );
    // }

    return Scaffold(
      key: scafolldKey,
      drawer: drawer(context: context),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10,right: 10),
        child: SpeedDial(
          overlayColor: Colors.white,
          backgroundColor: HexColor("#FFAE48"),
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          openCloseDial: isDialOpen,
          childPadding: EdgeInsets.all(10),
          spaceBetweenChildren: 4,
          dialRoot: customDialRoot
              ? (ctx, open, toggleChildren) {
            return ElevatedButton(
              onPressed: toggleChildren,
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding:
                EdgeInsets.symmetric(horizontal: 22, vertical: 18),
              ),
              child: Text(
                "Custom Dial Root",
                style: TextStyle(fontSize: 17),
              ),
            );
          }
              : null,
          buttonSize: 56,
          label: extend ? Text("Open") : null,

          activeLabel: extend ? Text("Close") : null,
          childrenButtonSize: 56.0,
          visible: visible,
          direction: speedDialDirection,
          switchLabelPosition: switchLabelPosition,
          closeManually: closeManually,
          renderOverlay: renderOverlay,
          // onOpen: () => print('OPENING DIAL'),
          // onClose: () => print('DIAL CLOSED'),
          useRotationAnimation: useRAnimation,
          tooltip: 'Open Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          elevation: 0.0,
          isOpenOnStart: false,
          animationSpeed: 200,

          childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [

            SpeedDialChild(
              labelStyle:TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),
              child: !rmicons ? Icon(Icons.check_circle_outline_outlined) : null,
              backgroundColor: Colors.white,
              labelBackgroundColor:  HexColor('#2972B7'),
              foregroundColor: HexColor('#2972B7'),
              label: 'مهمة جديدة',
              onTap: () {},
            ),
            SpeedDialChild(

              labelStyle:TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),
              child: !rmicons ? Image.asset('assets/images/Vector111.png',) : null,
              backgroundColor: Colors.white,
              labelBackgroundColor:  HexColor('#2972B7'),
              foregroundColor: HexColor('#2972B7'),
              label: 'عميل جديد',
              onTap: () {
                print('عميل جديد');
              },
            ),
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      appBar: AppBar(
        elevation: 1,
        title: Center(
          child: Text('أرشيف العملاء', style: TextStyle(
              fontFamily: 'Cairo',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15
          ),),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: ()=> scafolldKey.currentState!.openDrawer(),
            child: Icon(Icons.more_horiz,color: Colors.black,size: 25,)),
        actions: [
          Image.asset('assets/images/avatar3 1.png',width: 30,height: 30,),
          SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black)),
        ],
      ),
      body:(CustomerManagementArchive.cards.isNotEmpty)?
      Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              height: 71,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 275,
                    height: 40,
                    decoration: BoxDecoration(
                        color: HexColor('#E6E6E6'),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('بحث',style: TextStyle(
                            fontSize: 14,fontFamily: 'Cairo',
                            color: HexColor('#676767'),
                            fontWeight: FontWeight.w400
                        ),),
                        Icon(Icons.search)
                      ],
                    ),
                  ),
                  Image.asset('assets/images/Filter.png',height: 30,width: 30,),
                ],
              ),
            ),
            myDivider(3),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index) => Dismissible(
                      onDismissed: ( direction){
                        showAlertDialog(press: (){
                          CustomerManagementArchive.cards.removeAt(index);
                          deleteClient(context,widget.clientID.toString());
                        }, path: 'assets/images/icons8-delete-200 1.png', title: 'تأكيد الحذف',context: context);
                      },
                      // confirmDismiss: (DismissDirection direction) async{
                      //   CustomerManagementArchive.cards.removeAt(index);
                      //    },
                      key: Key(CustomerManagementArchive.cards[index].toString()),
                      background: Container(
                          color: HexColor('#E6E6E6'),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5,left: 5),
                                child: Column(
                                  children: [
                                    Icon(Icons.delete, color: Colors.red,size: 35,),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text('حذف نهائى',maxLines: 2,style: TextStyle(color: Colors.black,
                                        fontSize: 12,fontFamily: 'Cairo',fontWeight: FontWeight.w400),)
                                  ],
                                ),
                              ))),
                  child: CustomerManagementArchive.cards[index]),
                  separatorBuilder: (context,index) => myDivider(3),
                  itemCount: CustomerManagementArchive.cards.length),
            ),
          ],
        ),
      ) : Container(child: Center(child: Text('لا توجد بيانات', style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red
        ),),),
      ),
      backgroundColor: Colors.white,
    );
  }
}
