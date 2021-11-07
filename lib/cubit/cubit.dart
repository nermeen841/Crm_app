import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:crm_app/componnent/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'states.dart';

class AppCubit extends Cubit <AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Color customFlagColor = HexColor('#2972B7');

  var date ='';

  String time ='';

  bool visible1 = false;

  bool isSignIn = false;

  bool isLoginIn = false;

  bool isAddLeaded = false;
  bool isAddUnit = false;

  bool showMenu = false;

  String textMenu = '';

  bool showMenu1 = false;

  String textMenu1 = '';

  bool showMenu2 = false;

  String textMenu2 = '';


  void changeTextMenu({required String val}){
      textMenu = val;
      emit(ShowTextMenuSuccessState());
  }

  void changeShowMenu(){
    showMenu = !showMenu;
    emit(ShowMenuSuccessState());
  }
  //
  // void changeTextMenu1({required String val}){
  //     textMenu1 = val;
  //     emit(ShowTextMenuSuccessState1());
  // }
  // void changeShowMenu1(){
  //
  //   showMenu1 = !showMenu1;
  //   emit(ShowMenuSuccessState1());
  // }

  void changeTextMenu2({required String val}){
      textMenu2 = val;
      emit(ShowTextMenuSuccessState2());
  }
  void changeShowMenu2(){

    showMenu2 = !showMenu2;
    emit(ShowMenuSuccessState2());
  }

void changeTextMenu1({required String val}){
      textMenu1 = val;
      emit(ShowTextMenuSuccessState1());
  }
 void changeShowMenu1(){

    showMenu1 = !showMenu1;
    emit(ShowMenuSuccessState1());
  }


  // void changeFlagColor({required Color color}){
  //   // ignore: unnecessary_null_comparison
  //   if(color == null){
  //     customFlagColor = HexColor('#2972B7');
  //   }else{
  //     customFlagColor = color;
  //   }
  // }

  void changeAddLeaded(){
    isAddLeaded = !isAddLeaded;
    emit(AddLeadedSuccessState());
  }

 void changeAddUnit(){
   isAddUnit = !isAddUnit;
    emit(AddUnitSuccessState());
  }


  void changeFirstLogin(){
    isLoginIn = !isLoginIn;
    emit(LoginInSuccessState());
  }

  void changeSignIn(){
    isSignIn = !isSignIn;
    emit(SignInSuccessState());
  }

  // void changeFlag(){
  //   visible1 = !visible1;
  //   emit(AppSuccessState());
  // }

  void changeTime({required String newTime}){
    time = newTime;
    emit(AppTimeState());
  }

  void changedate({required DateTime selectedDate}){
      date = "${Jiffy().format(selectedDate.year.toString())}" +
        "/" +
        "${Jiffy().format(selectedDate.month.toString())}" +
        "/" +
        "${Jiffy().format(selectedDate.day.toString())}";
    emit(AppDateState());
  }
}