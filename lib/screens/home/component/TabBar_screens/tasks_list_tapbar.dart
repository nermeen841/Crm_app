import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/screens/drawer_screens/customer_managment/component/controller/get_done_task.dart';
import 'package:crm_app/screens/layout/crm_layout.dart';
import 'package:crm_app/screens/onBoarding/body.dart';
import 'package:crm_app/cubit/states.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'deatils_task_screen.dart';

class TasksListTapBar extends StatefulWidget {
  // final int selectedIndex;

  // const TasksListTapBar({Key? key,required this.selectedIndex}) : super(key: key);
  @override
  _TasksListTapBarState createState() => _TasksListTapBarState();
}
class _TasksListTapBarState extends State<TasksListTapBar>
  with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var detailsController = TextEditingController();
  var searchController = TextEditingController();
  var selectedDate = DateTime.now();
  late TimeOfDay _selectedTime;
  late TextEditingController _pickTimeController;

  String _timeText = '--:--';
  String _date = '01/01/1999';
  // int
  //
  // getSelectedIndex(){
  //   if(widget.selectedIndex !=null){
  //     setState(() {
  //       se
  //     });
  //   }
  // }

  final items = List<String>.generate(20, (i) => "Item ${i + 1}");
  final items2 = List<String>.generate(20, (i) => "Item ${i + 1}");


  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
    final DateTime now = DateTime.now();
    _selectedTime = TimeOfDay(hour: now.hour, minute: now.minute);
    _pickTimeController = TextEditingController(text: _timeText);
  }

  void modalBottomSheetMenuInTaskList(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (builder) {
          return BlocConsumer<AppCubit, AppStates>(
              builder: (context, state) {
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
                              // Row(
                              //   children: [
                              //     (AppCubit.get(context).visible1)
                              //         ? Container(
                              //             padding: EdgeInsets.symmetric(
                              //                 horizontal: 10, vertical: 10),
                              //             height: 44,
                              //             width: 260,
                              //             color: Colors.white,
                              //             child: Row(
                              //               textDirection: TextDirection.rtl,
                              //               children: [
                              //                 InkWell(
                              //                   onTap: (){
                              //                     AppCubit.get(context).changeFlagColor(color: HexColor('#FFAE48'),);
                              //                     AppCubit.get(context).changeFlag();
                              //                   },
                              //                   child: Row(
                              //                     children: [
                              //                       Icon(
                              //                         Icons.flag,
                              //                         color: HexColor('#FFAE48'),
                              //                       ),
                              //                       //FFAE48
                              //                       Text(
                              //                         'مهم',
                              //                         style: TextStyle(
                              //                             color: HexColor('#FFAE48'),
                              //                             fontSize: 13,
                              //                             fontWeight: FontWeight.bold,
                              //                             fontFamily: "Cairo"),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),
                              //
                              //                 SizedBox(
                              //                   width: 30,
                              //                 ),
                              //
                              //                 InkWell(
                              //                   onTap: (){
                              //                     AppCubit.get(context).changeFlagColor(color: HexColor('#C50B0B'),);
                              //                     AppCubit.get(context).changeFlag();
                              //                   },
                              //                   child: Row(
                              //                     children: [
                              //                       Icon(
                              //                         Icons.flag,
                              //                         color: HexColor('#C50B0B'),
                              //                       ),
                              //                       Text(
                              //                         'عاجل',
                              //                         style: TextStyle(
                              //                             color: HexColor('#C50B0B'),
                              //                             fontSize: 13,
                              //                             fontWeight: FontWeight.bold,
                              //                             fontFamily: "Cairo"),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),
                              //
                              //                 SizedBox(
                              //                   width: 30,
                              //                 ),
                              //
                              //                 InkWell(
                              //                   onTap: (){
                              //                     AppCubit.get(context).changeFlagColor(color: HexColor('#2972B7'),);
                              //                     AppCubit.get(context).changeFlag();
                              //                   },
                              //
                              //                   child: Row(
                              //                     children: [
                              //                       Icon(
                              //                         Icons.flag,
                              //                         color: HexColor('#2972B7'),
                              //                       ),
                              //                       Text(
                              //                         'طبعيي',
                              //                         style: TextStyle(
                              //                             color: HexColor('#2972B7'),
                              //                             fontSize: 13,
                              //                             fontWeight: FontWeight.bold,
                              //                             fontFamily: "Cairo"),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           )
                              //         : Text(
                              //             'اضافه مهمة جديدة',
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.bold,
                              //                 fontFamily: 'Cairo',
                              //                 fontSize: 13,
                              //                 color: Colors.black),
                              //           ),
                              //     Spacer(),
                              //     // InkWell(
                              //     //     onTap: () {
                              //     //       AppCubit.get(context).changeFlag();
                              //     //     },
                              //     //     child: Icon(
                              //     //       Icons.flag_outlined,
                              //     //       color: AppCubit.get(context).customFlagColor,
                              //     //       size: 30,
                              //     //     )),
                              //   ],
                              // ),
                              SizedBox(
                                height: 15,
                              ),
                              ListView(
                                primary: true,
                                shrinkWrap: true,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    width: 333,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: HexColor('#E6E6E6'),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          hintText: 'اكتب تفاصيل المهمة'),
                                      textDirection: TextDirection.rtl,
                                      controller: detailsController,
                                      maxLines: 4,
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showSearchAlertDialog(context);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: HexColor('#E6E6E6')),
                                          child: Text(
                                            'اختر العميل',
                                            style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 13,
                                                color: HexColor('#626262')),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          _selectDate(context);
                                          // AppCubit.get(context).changedate(selectedDate: selectedDate);
                                        },
                                        icon: Icon(
                                          Icons.calendar_today,
                                          color: HexColor('#2972B7'),
                                          size: 30,
                                        ),
                                      ),

                                      Container(
                                        width: 92,
                                        child: Center(
                                            child: Text(
                                          "${AppCubit.get(context).date}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Cairo',
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                      ////////////////////////


                                      IconButton(
                                        onPressed: () async {
                                          TimeOfDay? time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: _selectedTime,
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return Theme(
                                                data: ThemeData(
                                                  primaryColor: Colors.blue,
                                                  accentColor:
                                                      Colors.blueAccent,
                                                  buttonBarTheme:
                                                      ButtonBarThemeData(
                                                    buttonTextTheme:
                                                        ButtonTextTheme.accent,
                                                  ),
                                                ),
                                                child: child ?? Container(),
                                              );
                                            },
                                          );
                                          if (time != null) {
                                            MaterialLocalizations
                                                localizations =
                                                MaterialLocalizations.of(
                                                    context);
                                            String formattedTime = localizations
                                                .formatTimeOfDay(time,
                                                    alwaysUse24HourFormat:
                                                        false);
                                            if (formattedTime != null) {
                                              _timeText = formattedTime;
                                              _pickTimeController.text =
                                                  _timeText;
                                              AppCubit.get(context).changeTime(
                                                  newTime:
                                                      _pickTimeController.text);
                                            }
                                          }
                                        },
                                        icon: Icon(
                                          Icons.alarm,
                                          color: HexColor('#2972B7'),
                                          size: 30,
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        child: Center(
                                            child: Text(
                                          "${AppCubit.get(context).time.toString()}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Cairo',
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: InkWell(
                                      onTap: () {
                                        showSuccessAlertDialog(
                                            path: 'assets/images/99 1.png',
                                            context: context,
                                            title: 'تمت المهمة بنجاح',
                                            press: () {});
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> CrmAppLayout()));
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              listener: (context, state) {});
        });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        // initialDatePickerMode: DatePickerMode,
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      AppCubit.get(context).changedate(selectedDate: picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#E6E6E6'),
      body: ListView(
        primary: false,
        shrinkWrap: true,
        children: [
          myDivider(5),
          ExpandableNotifier(
              child: Card(
                  color: HexColor('#E6E6E6'),
                  elevation: 0,
                  //
                  clipBehavior: Clip.antiAlias,
                  child: Column(children: <Widget>[
                    ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: true,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                            ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                            iconColor: Colors.lightBlue,
                          ),
                          header: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                Text(
                                  'اليوم',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              Text(
                                '(3)',
                                //snapshot.data.toString()
                                style: TextStyle(color: Colors.grey),
                              ),
                              Spacer(),
                                IconButton(
                                  onPressed: () {
                                    modalBottomSheetMenuInTaskList(context);
                                  },
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                          collapsed: Text(
                            "",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            // style: AppTheme.heading.copyWith(fontSize: 8),
                          ),
                          expanded:
                          Container(
                            color: Colors.white,
                            child: FutureBuilder(
                              future: getTodayNewTask(),
                              builder: (context ,AsyncSnapshot snapshot ){
                                if(snapshot.hasData){
                                  return  ListView.separated(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemBuilder: (context , index) => InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailTaskScreen(),
                                              ));
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    showAlertDialogCancel(
                                                        context: context,
                                                        title: 'إتمام المهمة',
                                                        press: () {
                                                          showSuccessAlertDialog(path: 'assets/images/99 1.png',context: context,title: 'تمت المهمة بنجاح',press: (){});
                                                        },
                                                        path:
                                                        'assets/images/99 1.png');
                                                  },
                                                  child: Icon(
                                                    Icons.circle_outlined,
                                                    color: Colors.blue,
                                                    size: 20,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  'اجتماع مناقشة العرض المقدم لعميل ',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Cairo',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                SizedBox(width: 10),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  decoration: BoxDecoration(
                                                      color: HexColor('#DDEFFF'),
                                                      borderRadius:
                                                      BorderRadius.circular(10)),
                                                  height: 30,
                                                  child: Text(
                                                    'أ/أحمد علي   0101044975860 ',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Cairo',
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                // PopupMenuButton(
                                                //     icon: Icon(Icons.more_vert),
                                                //     itemBuilder: (context) => [
                                                //       PopupMenuItem(
                                                //         child: Column(
                                                //           children: [
                                                //             ListTile(
                                                //               title: Text(
                                                //                 "تعديل",
                                                //                 style: TextStyle(
                                                //                     fontFamily:
                                                //                     'Cairo',
                                                //                     fontSize: 15,
                                                //                     color: HexColor(
                                                //                         '#626262')),
                                                //               ),
                                                //               onTap: () {
                                                //                 // showAlertDialog(context: context ,press: (){
                                                //                 //   showASuccesslertDialog(context);
                                                //                 // },title: 'تأكيد الحذف',path: 'assets/images/icons8-delete-200 1.png');
                                                //               },
                                                //             ),
                                                //             SizedBox(
                                                //               height: 5,
                                                //             ),
                                                //             myDivider(1),
                                                //           ],
                                                //         ),
                                                //         value: 1,
                                                //       ),
                                                //       PopupMenuItem(
                                                //         child: ListTile(
                                                //           title: Text(
                                                //             "حذف",
                                                //             style: TextStyle(
                                                //               fontFamily: 'Cairo',
                                                //               fontSize: 15,
                                                //               color: HexColor(
                                                //                   '#C50B0B'),
                                                //             ),
                                                //           ),
                                                //           onTap: () {
                                                //             showAlertDialog(
                                                //                 context: context,
                                                //                 press: () {
                                                //                   showSuccessAlertDialog(
                                                //                       path: 'assets/images/icons8-delete-200 1.png',
                                                //                       context: context,
                                                //                       title: 'تم تأكيد الحذف',
                                                //                       press: () {});
                                                //                 },
                                                //                 title: 'تأكيد الحذف',
                                                //                 path: 'assets/images/icons8-delete-200 1.png');
                                                //           },
                                                //         ),
                                                //         value: 2,
                                                //       )
                                                //     ]),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 15),
                                                  child: Icon(
                                                    Icons.alarm,
                                                    color: HexColor('#2972B7'),
                                                    size: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Today',
                                                  style: TextStyle(
                                                      fontFamily: "Cairo,",
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                      color: HexColor('#676767')),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  '9:00 am',
                                                  style: TextStyle(
                                                      fontFamily: "Cairo,",
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                      color: HexColor('#676767')),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      separatorBuilder:(context , index) => myDivider(5),
                                      itemCount: snapshot.data.length);
                                }else{
                                  return Container();
                                }
                              },
                            ),
                          ),

                        ))
                  ])),

          ),

          SizedBox(
            height: 20,
          ),

          ExpandableNotifier(
              child: Card(
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  child: Column(children: <Widget>[
                    ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: true,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                            ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                Text(
                                  'مهام متأخرة ',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  // snapshot.data.toString()
                                  '(4)',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          collapsed: Text(
                            "",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            // style: AppTheme.heading.copyWith(fontSize: 8),
                          ),
                          expanded:
                          Container(
                            height: MediaQuery.of(context).size.height * 1.1,
                            child: FutureBuilder(
                              future: getLateTask(),
                              builder: (context, AsyncSnapshot snapshot ){
                                if(snapshot.hasData){
                                  return ListView.separated(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemBuilder: (context , index)=> InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailTaskScreen(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    showAlertDialogCancel(
                                                        context: context,
                                                        title: 'إتمام المهمة',
                                                        press: () {
                                                          showSuccessAlertDialog(
                                                              path:
                                                              'assets/images/99 1.png',
                                                              context: context,
                                                              title:
                                                              'تمت المهمة بنجاح',
                                                              press: () {});
                                                        },
                                                        path:
                                                        'assets/images/99 1.png');
                                                  },
                                                  child: Icon(
                                                    Icons.circle_outlined,
                                                    color: Colors.blue,
                                                    size: 20,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  'اجتماع مناقشة العرض المقدم لعميل ',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Cairo',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                SizedBox(width: 10),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  decoration: BoxDecoration(
                                                      color: HexColor('#DDEFFF'),
                                                      borderRadius:
                                                      BorderRadius.circular(10)),
                                                  height: 30,
                                                  child: Text(
                                                    'أ/أحمد علي   0101044975860 ',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Cairo',
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                // PopupMenuButton(
                                                //     icon: Icon(Icons.more_vert),
                                                //     itemBuilder: (context) => [
                                                //       PopupMenuItem(
                                                //         child: Column(
                                                //           children: [
                                                //             ListTile(
                                                //               title: Text(
                                                //                 "تعديل",
                                                //                 style: TextStyle(
                                                //                     fontFamily:
                                                //                     'Cairo',
                                                //                     fontSize: 14,
                                                //                     color: HexColor(
                                                //                         '#626262')),
                                                //               ),
                                                //             ),
                                                //             SizedBox(
                                                //               height: 5,
                                                //             ),
                                                //             myDivider(1),
                                                //           ],
                                                //         ),
                                                //         value: 1,
                                                //       ),
                                                //       PopupMenuItem(
                                                //         child: ListTile(
                                                //           title: Text(
                                                //             "حذف",
                                                //             style: TextStyle(
                                                //               fontFamily: 'Cairo',
                                                //               fontSize: 15,
                                                //               color: HexColor(
                                                //                   '#C50B0B'),
                                                //             ),
                                                //           ),
                                                //           onTap: () {
                                                //             showAlertDialog(
                                                //                 context: context,
                                                //                 press: () {
                                                //                   showSuccessAlertDialog(
                                                //                       path:
                                                //                       'assets/images/icons8-delete-200 1.png',
                                                //                       context:
                                                //                       context,
                                                //                       title:
                                                //                       'تم تأكيد الحذف',
                                                //                       press: () {});
                                                //                 },
                                                //                 title: 'تأكيد الحذف',path: 'assets/images/icons8-delete-200 1.png');
                                                //           },
                                                //         ),
                                                //         value: 2,
                                                //       )
                                                //     ]),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(right: 15),
                                                  child: Icon(
                                                    Icons.alarm,
                                                    color: HexColor('#2972B7'),
                                                    size: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  '15 sep',
                                                  style: TextStyle(
                                                      fontFamily: "Cairo,",
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.red),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  '9:00 am',
                                                  style: TextStyle(
                                                      fontFamily: "Cairo,",
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.red),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      separatorBuilder:  (context , index)=> myDivider(5),
                                      itemCount: snapshot.data.length);
                                }else{
                                  return Container();
                                }
                              },
                            ),
                          ),

                        ))
                  ])),
          )],
      ),
    );
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
