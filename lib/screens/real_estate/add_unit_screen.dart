import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/cubit/cubit.dart';
import 'package:crm_app/cubit/states.dart';
import 'package:crm_app/screens/real_estate/controller/add_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUnit extends StatefulWidget {
  const AddUnit({Key? key, required this.projectID,}) : super(key: key);

  @override
  _AddUnitState createState() => _AddUnitState();
  final String projectID;
}

class _AddUnitState extends State<AddUnit> {
  var formKey = GlobalKey<FormState>();

   TextEditingController nameUnit = TextEditingController();

    TextEditingController tyeUnit = TextEditingController();

    TextEditingController roomsUnit = TextEditingController();

    TextEditingController spaceUnit = TextEditingController();

    TextEditingController floorUnit = TextEditingController();

    TextEditingController adderssUnit = TextEditingController();

    TextEditingController kitchenUnit = TextEditingController();

    TextEditingController priceUnit = TextEditingController();

    TextEditingController bathroomUnit = TextEditingController();

    // CityID: ,
  //                                   ClientID: ,
  //                                   ProjectID: ,
  //                                   notes: ,



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
                      Text("اضافة وحدة جديد",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("اسم الوحدة *",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 2,
                      ),
                      UnitTextfield(type: TextInputType.text, controller:nameUnit ,height: 50,),
                      SizedBox(
                        height: 10,
                      ),
                      Text("نوع الوحدة *",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 2,
                      ),
                      UnitTextfield(type: TextInputType.text, controller: tyeUnit,height: 50,),
                      SizedBox(
                        height: 10,
                      ),
                      Text("سعر الوحدة",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 2,
                      ),
                      UnitTextfield(type: TextInputType.number, controller: priceUnit,height: 50),
                      SizedBox(
                        height: 10,
                      ),
                      Text("الطابق ",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 5,
                      ),
                      UnitTextfield(type: TextInputType.number, controller: floorUnit,height: 50,),
                      Text("عدد الغرف",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 5,
                      ),
                      UnitTextfield(type: TextInputType.number, controller: roomsUnit,height: 50,),
                      SizedBox(
                        height: 10,
                      ),
                      Text("عنوان الوحدة",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 2,
                      ),
                      UnitTextfield(type: TextInputType.streetAddress, controller: adderssUnit,height: 50,),
                      SizedBox(
                        height: 10,
                      ),

                      Text("عدد الطابخ",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 2,
                      ),
                      UnitTextfield(type: TextInputType.number, controller: kitchenUnit,height: 50,),
                      SizedBox(
                        height: 10,
                      ),

                      Text("عدد الحمامات",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      SizedBox(
                        height: 2,
                      ),
                      UnitTextfield(type: TextInputType.number, controller: bathroomUnit,height: 50,),
                      SizedBox(height:10),
                      Text(" المساحة",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      UnitTextfield(type: TextInputType.number, txt: 'ملاحظات',height: 100,controller: spaceUnit),
                      SizedBox(height:10),
                      Text(" الملاحظات",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 13,fontFamily: 'Cairo'
                      ),),
                      UnitTextfield(type: TextInputType.text, txt: 'ملاحظات',height: 100),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: (AppCubit.get(context).isAddUnit)?Container(child: Center(child: CircularProgressIndicator(),),):
                        BlocConsumer<AppCubit, AppStates>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return AppCubit.get(context).isAddUnit ? CircularProgressIndicator() :
                            InkWell(
                              onTap: () {
                                AppCubit.get(context).changeAddUnit();
                                print('unit name ------------------------------------ : ${nameUnit.text.toString()}... ${tyeUnit.text.toString()}');
                                addUnit(
                                  CityID: '1',
                                  ClientID: 'None',
                                  ProjectID: widget.projectID,
                                  context: context,
                                    type: tyeUnit.text.toString(),
                                    name: nameUnit.text.toString(),
                                    address: adderssUnit.text.toString() ,
                                  bathroom: bathroomUnit.text.toString(),
                                  floor: floorUnit.text.toString(),
                                  kitchen: kitchenUnit.text.toString(),
                                  rooms: roomsUnit.text.toString(),
                                  price: priceUnit.text.toString(),
                                  space:spaceUnit.text.toString() ,
                                );
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

  UnitTextfield({required TextInputType type, TextEditingController? controller,  double? height, String? title,String? txt}) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric( horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: HexColor("#E6E6E6")
      ),
      child: TextFormField(
        // initialValue: txt,
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
