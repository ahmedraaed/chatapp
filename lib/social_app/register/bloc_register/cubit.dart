
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/social_app/register/bloc_register/model_register.dart';

import 'package:noteappflutter/social_app/register/bloc_register/state.dart';

class SocialRigesterCubit extends Cubit<SocialRigesterStates>
{
  SocialRigesterCubit():super(SocialRigesterInitState());
  
  
  static SocialRigesterCubit get(context) =>BlocProvider.of(context);


 // ModelData? newmodelData;

void userregister({
   required username,
  required String email,
  required String password,
   required String phone,
})
{
  emit(SocialRigesterLoadingState());
  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value)
  {

    print(value.user!.email);
    creatdatabase(username: username, email: email, uid: value.user!.uid, phone: phone);
    emit(SocialRigesterSucssesState());
  }).catchError((onError){
    print(onError);
    emit(SocialRigesterErrorState(onError));

  });
}

void creatdatabase({
  required String username,
  required String email,
  required String uid,
  required String phone,

})
{
  ModelResgister modelresgister=ModelResgister(
      email: email,
      name: username,
      phone: phone,
      uid: uid ,
      bio: 'write',
      image:'https://img.freepik.com/free-photo/close-up-islamic-new-year-concept_23-2148611670.jpg?t=st=1654581023~exp=1654581623~hmac=689f0e7e4688cbb842fec90cf5cae6c771aa1ab3a314caaf0620955424d0a90b&w=1060',
      cover: 'https://img.freepik.com/free-photo/close-up-islamic-new-year-concept_23-2148611670.jpg?t=st=1654581023~exp=1654581623~hmac=689f0e7e4688cbb842fec90cf5cae6c771aa1ab3a314caaf0620955424d0a90b&w=1060',
  );

    FirebaseFirestore.instance.collection('user').doc(uid).set(
    modelresgister.tomap()
  ).then((value) {

    emit(SocialCreateRigesterSucssesState());
  }).catchError((onError){
    emit(SocialCreateRigesterErrorState(onError));
  });


}

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
    emit(SocialRigesterChangepassIcon());

  }
  
  void Logindata(
  {
  required String Email,
    required String Password,
  })
  {}
  
}