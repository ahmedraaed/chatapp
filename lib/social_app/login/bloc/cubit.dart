
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:noteappflutter/social_app/login/bloc/state.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates>
{
  SocialLoginCubit():super(SocialLoginInitState());
  
  
  static SocialLoginCubit get(context) =>BlocProvider.of(context);


 // ModelData? newmodelData;



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
    emit(SocialLoginChangepassIcon());

  }
  
  void Logindata(
  {
  required String Email,
    required String Password,
  })
  {
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: Email, password: Password).then((value)
    {
      print(value.user!.email);
      print(value.user!.uid);
      emit(SocialLoginSucssesState(value.user!.uid));
    }).catchError((onError)
    {
      print(onError);
      emit(SocialLoginErrorState(onError));
    });
  }
  
}