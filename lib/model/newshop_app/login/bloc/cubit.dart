
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/model/newshop_app/login/bloc/state.dart';
import 'package:noteappflutter/model/newshop_app/login/modeldata.dart';
import 'package:noteappflutter/network/remotly/diohelper.dart';
import 'package:noteappflutter/network/remotly/end_point.dart';

class NewShopCubit extends Cubit<NewShopLoginStates>
{
  NewShopCubit():super(NewShopInitState());
  
  
  static NewShopCubit get(context) =>BlocProvider.of(context);


  ModelData? newmodelData;



  IconData defultpassIcon=Icons.remove_red_eye_outlined;
  bool passhide=true;


  void changepassowerdicon()
  {
    passhide=!passhide;
    if(passhide==true)
      {
        defultpassIcon=Icons.remove_red_eye_outlined;
      }
    else
      {
        defultpassIcon=Icons.remove_red_eye;

      }
    emit(ChangepassIcon());

  }
  
  void newpostdata(
  {
  required String Email,
    required String Password,
  })
  {
    emit(NewShopLoadingState());
    DioHealper.newpostdata(url: LOGIN,
        data:
        {
          "email":Email,
          "password":Password,

        }
        ).then((value) {
         // print(value.data);
        newmodelData=ModelData.fromJson(value.data);
        emit(NewShopSucssesState( newmodelData));
    }).catchError((onError){
      emit(NewShopErrorState(onError.toString()));
    });
  }
  
}