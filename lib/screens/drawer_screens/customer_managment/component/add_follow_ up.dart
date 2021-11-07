import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component.dart';
import 'controller/followup_api.dart';
import 'customers_manage.dart';

class AddFollowUp extends StatefulWidget {

   final String name;
   final String email;
   final String phone;
   final String state;
   final String clientId;
   final String referral;

  const AddFollowUp(
      {Key? key,
      required this.name,
      required this.email,
      required this.phone,
      required this.state,
      required this.clientId,
      required this.referral}) : super(key: key);

  @override
  _AddFollowUpState createState() => _AddFollowUpState();
}

class _AddFollowUpState extends State<AddFollowUp> {
  var selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      // initialDatePickerMode: DatePickerMode,
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      // AppCubit.get(context).changedate(selectedDate: picked);
    }
  }
  var selectedDat = DateTime.now();
  Future<void> __selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      // initialDatePickerMode: DatePickerMode,
        context: context,
        initialDate: selectedDat,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDat) {
      setState(() {
        selectedDat = picked;
      });
      // AppCubit.get(context).changedate(selectedDate: picked);
    }
  }
  var scafolldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafolldKey,
      drawer: drawer(context: context),
      appBar: AppBar(
        elevation: 1,
        title: Center(
          child: Text('متابعة جديدة', style: TextStyle(
              fontFamily: 'Cairo',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15
          ),),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: ()=> scafolldKey.currentState!.openDrawer(),
            child: Icon(Icons.more_horiz,color: Colors.black,size: 25,)),
        actions: [
          // Image.asset('assets/images/avatar3 1.png',width: 30,height: 30,),
          // SizedBox(
          //   width: 10,
          // ),
          InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black)),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCustomerManagementCard(
                context: context,
                clientName: widget.name,
                email: (widget.email != 'null') ? widget.email : null,
                id: widget.clientId,
                cellPhone: widget.phone,
                clientState: (widget.state != 'null') ? widget.state : null,
                referral: (widget.referral != 'null')? widget.referral : null,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text('تاريخ المتابعة',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 12,
                  fontFamily: 'Cairo',
                  color: HexColor('#626262')
                ),),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 35,
                  width: 333,
                  decoration: BoxDecoration(
                    color: HexColor('#E6E6E6'),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: ()=> _selectDate(context),
                    child: Center(
                      child: Text(
                          "${selectedDate.year.toString()}" + "/" + "${selectedDate.month.toString()}" + "/" + "${selectedDate.day.toString()}",
                        style: TextStyle(
                        color: HexColor('#333333'),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text('التاريخ القادم',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 12,
                      fontFamily: 'Cairo',
                      color: HexColor('#626262')
                  ),),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 35,
                  width: 333,
                  decoration: BoxDecoration(
                    color: HexColor('#E6E6E6'),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: ()=> __selectDate(context),
                    child: Center(
                      child: Text(
                        "${selectedDat.year.toString()}" + "/" + "${selectedDat.month.toString()}" + "/" + "${selectedDat.day.toString()}",
                        style: TextStyle(
                          color: HexColor('#333333'),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Center(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 110,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                        color: HexColor('#E6E6E6'),
                    ),
                    child: TextFormField(
                      controller:notesController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: 'كتابة ملاحظات',
                      ),
                      style: TextStyle(color: HexColor('#626262'),fontFamily: 'Cairo',),
                      textDirection: TextDirection.rtl,
                    )),
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.bottomLeft,
                child: (AppCubit.get(context).isAddLeaded)? Container(child: Center(child: CircularProgressIndicator(),),):
                BlocConsumer<AppCubit,AppStates>(
                  listener: (context , state){},
                  builder: (context , state){
                    return AppCubit.get(context).isAddLeaded ? CircularProgressIndicator():
                    InkWell(
                      onTap: () {
                        AppCubit.get(context).changeAddLeaded();
                        addFollowUp(
                            ClientID:widget.clientId.toString(),
                            contactingDateTime : selectedDate.toString(),
                            contactingType :widget.state.toString(),
                            nextContactingDateTime : selectedDat.toString(),
                            context: context);
                        // Navigator.push(context, MaterialPageRoute(builder:(context)=> CustomerManageEditing()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
