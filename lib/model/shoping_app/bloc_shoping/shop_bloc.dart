import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/model/shoping_app/bloc_shoping/shop_state.dart';
import 'package:noteappflutter/model/shoping_app/model_data.dart';
import 'package:noteappflutter/network/remotly/diohelper.dart';

import '../../../network/remotly/end_point.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit():super(ShopInitialState());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);


   late ShopLoginData logindata;

  void userLogin({
  required String email,
    required String password,
})
  {
    emit(ShopLoginLodingState());
    DioHealper.postdata(url: LOGIN,
        data:
    {
      'email': email,
      'password':password,
    }).then((value) {
      logindata=ShopLoginData.Fromjson(value.data);
      emit(ShopLoginSucssesState(loginData: logindata));
    }).catchError((onError){
      print("the erorr is  : $onError");
      emit(ShopLoginErrorState(onError.toString()));
    });
  }
  IconData passicon=Icons.visibility;
  bool issecured=true;
  void changepassowerdstate()
  {
    issecured=!issecured;
    passicon=issecured?Icons.visibility:Icons.visibility_off;
    emit(changeLoginPassowerStat());
  }


}