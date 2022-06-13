
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/model/newshop_app/newshop_screen/bloc/states.dart';
import 'package:noteappflutter/model/newshop_app/newshop_screen/fevourit_screen.dart';
import 'package:noteappflutter/model/newshop_app/newshop_screen/modelshop.dart';
import 'package:noteappflutter/model/newshop_app/newshop_screen/product_screen.dart';
import 'package:noteappflutter/model/newshop_app/newshop_screen/setting_screen.dart';
import 'package:noteappflutter/model/shoping_app/shop_layout/model_home.dart';
import 'package:noteappflutter/network/remotly/diohelper.dart';
import 'package:noteappflutter/sharecomponent/contant.dart';
import '../../../../network/remotly/end_point.dart';
import '../category_screen.dart';
import '../model/home_model.dart';

class NewShopHomeCubit extends Cubit<NewShopHomeStates>
{
  NewShopHomeCubit():super(NewShopInitstate());

  static NewShopHomeCubit get(context)=>BlocProvider.of(context);

  int currentindex=0;

   List<Widget> ShopScreen=
      [
        NewProductScreen(),
        NewCategoryScreen(),
        NewFevouritScreen(),
        NewSitteingScreen(),
      ];
  void changeNavbottom(int index)
  {
    currentindex=index;
    emit(ChangeBottomNavigation());

  }

   HomeModel? homemode;

  var shopmodelnew=shopmodelproduct();

  void getallHomeData()
  {
    emit(NewShopLoadingstate());

    DioHealper.newgetdata(url: 'home').then((value)
    {
      shopmodelnew=shopmodelproduct.fromJson(value.data);
      print(shopmodelnew);
      homemode=HomeModel.fromJson(value.data);
      print(homemode!.status);
      if(homemode==null)
        {
          print('modle is null');
        }

      emit(NewShopSucseedstate());
    }).catchError((onError){
      emit(NewShopErrorstate());
    });
  }
  ModelHome?  modelHome;
  void getHomData()
  {
    emit(NewShopLoadingstate());
    DioHealper.getData(url: HOME,token: token).then((value) {
      modelHome=ModelHome.fromjson(value.data);
      //printFullText(modelHome!.data!.products[0].image.toString());
      print(modelHome);
      emit(NewShopSucseedstate());

    }).catchError((error){
      print('error is :  $error');
      emit(NewShopErrorstate());
    });
  }
}