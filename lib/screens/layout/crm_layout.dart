import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/cubit/states.dart';
import 'package:crm_app/screens/bottom_navbar_screens/calendar_screen.dart';
import 'package:crm_app/screens/bottom_navbar_screens/notificaton_screen.dart';
import 'package:crm_app/screens/bottom_navbar_screens/search_screen.dart';
import 'package:crm_app/screens/drawer_screens/customer_managment/component/tasks_screen.dart';
import 'package:crm_app/screens/home/HomeScreen.dart';
import 'package:crm_app/screens/home/component/leads/add_new_lead.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CrmAppLayout extends StatefulWidget {

  final int index;

  const CrmAppLayout({Key? key,required this.index}) : super(key: key);


  @override
  _CrmAppLayoutState createState() => _CrmAppLayoutState();
}

class _CrmAppLayoutState extends State<CrmAppLayout> with TickerProviderStateMixin{

  var selectedDate = DateTime.now();
  late TimeOfDay _selectedTime;
  late TextEditingController _pickTimeController;
  var detailsController = TextEditingController();
  late TabController _tabController;

  getIndex(){
    if(widget.index == null){
      setState(() {
        currentIndex = 0;
      });
    }else{
      setState(() {
        currentIndex = widget.index;
      });
    }
  }

  @override
  void initState() {
    this.getIndex();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
    final DateTime now = DateTime.now();
    _selectedTime = TimeOfDay(hour: now.hour, minute: now.minute);
    _pickTimeController = TextEditingController(text: _timeText);
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
  String _timeText = '--:--';
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
                              //       padding: EdgeInsets.symmetric(
                              //           horizontal: 10, vertical: 10),
                              //       height: 44,
                              //       width: 260,
                              //       decoration: BoxDecoration(
                              //           color: Colors.white,
                              //           boxShadow: [
                              //             BoxShadow(
                              //                 color: Colors.grey.shade300,
                              //                 offset: Offset(0, 3),
                              //                 spreadRadius: 3)
                              //           ]),
                              //       child: Row(
                              //         textDirection: TextDirection.rtl,
                              //         children: [
                              //           Icon(
                              //             Icons.flag,
                              //             color: HexColor('#FFAE48'),
                              //           ),
                              //           //FFAE48
                              //           Text(
                              //             'مهم',
                              //             style: TextStyle(
                              //                 color: HexColor('#FFAE48'),
                              //                 fontSize: 13,
                              //                 fontWeight: FontWeight.bold,
                              //                 fontFamily: "Cairo"),
                              //           ),
                              //
                              //           SizedBox(
                              //             width: 30,
                              //           ),
                              //
                              //           Icon(
                              //             Icons.flag,
                              //             color: HexColor('#C50B0B'),
                              //           ),
                              //           Text(
                              //             'عاجل',
                              //             style: TextStyle(
                              //                 color: HexColor('#C50B0B'),
                              //                 fontSize: 13,
                              //                 fontWeight: FontWeight.bold,
                              //                 fontFamily: "Cairo"),
                              //           ),
                              //
                              //           SizedBox(
                              //             width: 30,
                              //           ),
                              //
                              //           Icon(
                              //             Icons.flag,
                              //             color: HexColor('#2972B7'),
                              //           ),
                              //           Text(
                              //             'طبعيي',
                              //             style: TextStyle(
                              //                 color: HexColor('#2972B7'),
                              //                 fontSize: 13,
                              //                 fontWeight: FontWeight.bold,
                              //                 fontFamily: "Cairo"),
                              //           ),
                              //         ],
                              //       ),
                              //     )
                              //         : Text(
                              //       'اضافه مهمة جديدة',
                              //       style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           fontFamily: 'Cairo',
                              //           fontSize: 13,
                              //           color: Colors.black),
                              //     ),
                              //     Spacer(),
                              //     // InkWell(
                              //     //     onTap: () {
                              //     //       AppCubit.get(context).changeFlag();
                              //     //     },
                              //     //     child: Icon(
                              //     //       Icons.flag_outlined,
                              //     //       color: HexColor('#2972B7'),
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
                                        showSuccessAlertDialog(path: 'assets/images/99 1.png',context: context,title: 'تمت المهمة بنجاح',press: (){});
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

  ///////////////////////////////////////////////////////////////////////////////////


  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    NotificationScreen(),
    TasksScreenInDrawer(),
    CalendarScreen(),
    SearchScreen(),
  ];

  List<String> titles = [
    'الرئيسية',
    'اشعارات',
    'المهام',
    'التقويم',
    'بحث',

  ];

  void changeIndex(int index) {
    currentIndex = index;
  }


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

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         key: scaffoldKey,
        backgroundColor: Colors.grey,
        drawer : drawer(context: context),
        body: screens[currentIndex],
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
            onTap: () {
              modalBottomSheetMenuInTaskList(context);
            },
          ),
          SpeedDialChild(
            labelStyle:TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),
            child: !rmicons ? Image.asset('assets/images/Vector111.png',) : null,
            backgroundColor: Colors.white,
            labelBackgroundColor:  HexColor('#2972B7'),
            foregroundColor: HexColor('#2972B7'),
            label: 'عميل جديد',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddLead() ));
            },
          ),
        ],
      ),
    ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.rtl,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                changeIndex(index);
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'الرئيسية',),

              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_outlined),
                  label: 'اشعارات'),

              BottomNavigationBarItem(
                  icon: Icon(Icons.flag_outlined),
                  label: 'المهام'),

              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined),
                  label: 'التقويم'),

              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  label: 'بحث'),
            ],
             type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontFamily: 'Cairo',fontSize: 10,fontWeight: FontWeight.bold,color: HexColor('#2972B7')),
            unselectedLabelStyle: TextStyle(fontFamily: 'Cairo',fontSize: 10,fontWeight: FontWeight.bold,color: HexColor('#626262')),
            iconSize: 25,

          ),
        ),
    );
  }

}

