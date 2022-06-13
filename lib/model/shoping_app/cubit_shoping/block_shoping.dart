import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/model/shoping_app/cubit_shoping/states.dart';
import 'package:noteappflutter/model/shoping_app/shop_layout/model_home.dart';
import 'package:noteappflutter/network/remotly/diohelper.dart';
import 'package:noteappflutter/sharecomponent/contant.dart';

import '../../../layout/news_screens/setting.dart';
import '../../../network/remotly/end_point.dart';
import '../shop_layout.dart';
import '../shop_layout/catagories_screen.dart';
import '../shop_layout/favourit_screen.dart';
import '../shop_layout/prodauct_screen.dart';

class ShopHomeCubit extends Cubit<ShopingHomeStates>
{
  ShopHomeCubit():super(ShopingHomeInitstat());

  static ShopHomeCubit get(context) => BlocProvider.of(context);



  int currentindex=0;
  List<Widget> ShopScreen=
  [
    ProductScreen(),
    CatagoriesScreen(),
    FavouritScreen(),
    SettingScreen(),
  ];


  void ChangeScreen(index)
  {
    currentindex=index;
    emit(ShopingHomeChangeBottonState());
  }

      ModelHome? modelHome;

  void getHomData()
  {
    emit(ShopingHomeLoadingState());
    DioHealper.getData(url: HOME,token: token).then((value) {
      modelHome=ModelHome.fromjson(value.data);
      //printFullText(modelHome!.data!.products[0].image.toString());
      emit(ShopingHomeSucsseState());

    }).catchError((error){
      print('error is :  $error');
      emit(ShopingHomeErorrState());
    });
  }

}