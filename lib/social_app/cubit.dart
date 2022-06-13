
// import 'dart:html';

//import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noteappflutter/sharecomponent/contant.dart';
import 'package:noteappflutter/social_app/massage_model.dart';
import 'package:noteappflutter/social_app/post_model.dart';
import 'package:noteappflutter/social_app/register/bloc_register/model_register.dart';
import 'package:noteappflutter/social_app/screens/chat.dart';
import 'package:noteappflutter/social_app/screens/feeds.dart';
import 'package:noteappflutter/social_app/screens/settings.dart';
import 'package:noteappflutter/social_app/screens/users.dart';
import 'package:noteappflutter/social_app/states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class SocaialCubit extends Cubit<SocialGetUserStates>
{
  SocaialCubit() :super(SocialGetUserInitState());


  static SocaialCubit get(context)=>BlocProvider.of(context);

    ModelResgister modelResgister=ModelResgister(email: '', name: '', phone: '', uid: '');
  
  void getvireficatio()
  {
    FirebaseFirestore.instance.collection('user').doc(uid).get().then((value)
    {
      print(value.data());
      modelResgister=ModelResgister.fromjson(value.data() as Map<String,dynamic>);
      emit(SocialGetUserSucssesState());

    }).catchError((onError)
    {
      print(onError);
      emit(SocialGetUserErrorState());
    });
  }


  int currentindex=0;
  List<Widget> SocialScreens=
      [
        SocialFeeds(),
        SocialChat(),
        SocialUsers(),
        SocialSetting(),
      ];

  List<String> Socialtittels=
  [
    'Home',
    'Chat',
    'Users',
    'Setting',
  ];


  void changescreens(int index)
  {
    if(index==1)
      getUserss();
    currentindex=index;
    emit(SocialChangeNavigatebottomState());
  }

   File? profileIamge;
  var imagePicker  = ImagePicker();
  Future GetProfileImage()async
  {
    final pickedFile=await imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedFile!=null)
      {
        profileIamge=File(pickedFile.path);
        emit(SocialChangeImageProfileSucssesState());
      }else
        {
          print('no image to select');
          emit(SocialChangeImageProfileErrorState());
        }
  }

   File? coverIamge;
  Future GetCoverIamge()async
  {
    final coverfile = await imagePicker.pickImage(source: ImageSource.gallery);
    if(coverfile != null)
      {
        coverIamge=File(coverfile.path);
        emit(SocialChangeCoverProfileSucssesState());
      }else
        {
          print('no cover to selected');
          emit(SocialChangeCoverProfileErrorState());
        }

  }

  String? IamgeProfileUpdate;
  void UploadProfileIamge({
    required String bio,
    required String phone,
    required String username,
})
  {
     firebase_storage.FirebaseStorage.instance.ref().
    child('Users/${Uri.file(profileIamge!.path).pathSegments.last}').putFile(profileIamge as File).then((p0) {
      p0.ref.getDownloadURL().then((value) {
         print(value);
         IamgeProfileUpdate=value;
         userUpdate(bio: bio, phone: phone, username: username,image: value);

        emit(SocialUpdateImageProfileSucssesState());
      }).catchError((onError){
        emit(SocialUpdateImageProfileErrorState());
      });
    }).catchError((onError){
      emit(SocialUpdateImageProfileErrorState());
    });
  }

  String? CoverIamgeUpdate;

  void UpdateCoverIamge({
    required String bio,
    required String phone,
    required String username,
})
  {
    emit(SocialLoadingUpdate());
     firebase_storage.FirebaseStorage.instance.ref().
    child('User/${Uri.file(coverIamge!.path).pathSegments.last}').
    putFile(coverIamge as File).then((p0) {
      p0.ref.getDownloadURL().then((value) {
        CoverIamgeUpdate=value;
        userUpdate(bio: bio, phone: phone, username: username,cover: value);
      emit(SocialUpdateCoverProfileSucssesState());
      }).catchError((onError){
        emit(SocialUpdateCoverProfileErrorState());
      });
    }).catchError((onError){
      emit(SocialUpdateCoverProfileErrorState());
    });
  }



  void userUpdate(
  {
  required String bio,
  required String phone,
  required String username,
    String? image,
    String? cover,

})
  {

    ModelResgister modelresgister=ModelResgister(
      email: modelResgister.email,
      name: username,
      phone: phone,
      uid: modelResgister.uid ,
      bio: bio,
      image:IamgeProfileUpdate ==null?'https://img.freepik.com/free-photo/close-up-islamic-new-year-concept_23-2148611670.jpg?t=st=1654581023~exp=1654581623~hmac=689f0e7e4688cbb842fec90cf5cae6c771aa1ab3a314caaf0620955424d0a90b&w=1060' : IamgeProfileUpdate,
      cover: CoverIamgeUpdate ==null?'https://img.freepik.com/free-photo/close-up-islamic-new-year-concept_23-2148611670.jpg?t=st=1654581023~exp=1654581623~hmac=689f0e7e4688cbb842fec90cf5cae6c771aa1ab3a314caaf0620955424d0a90b&w=1060':CoverIamgeUpdate ,
    );
    FirebaseFirestore.instance.collection('user').doc(uid).update(modelresgister.tomap()).then((value) {
      getvireficatio();
    }).catchError((onError){});
  }

  //post

  File? PostIamge;
  Future GetPostIamge()async
  {
    final Postfile = await imagePicker.pickImage(source: ImageSource.gallery);
    if(Postfile != null)
    {
      PostIamge=File(Postfile.path);
      emit(SocialUploadPostImageSucssesState());
    }else
    {
      print('no cover to selected');
      emit(SocialUploadPostImageErrorState());
    }

  }



  void UpdatePostIamge({
    required String dateTime,
    required String text,

  })
  {
    emit(SocialCreatPostLoadingState());
    firebase_storage.FirebaseStorage.instance.ref().
    child('post/${Uri.file(PostIamge!.path).pathSegments.last}').
    putFile(PostIamge as File).then((p0) {
      p0.ref.getDownloadURL().then((value) {
        creatPost(dateTime: dateTime, text: text,postImage: value);
        emit(SocialCreatPostSucssesState());
      }).catchError((onError){
        print('erorr is $onError');
        emit(SocialCreatPostErrorState());
      });
    }).catchError((onError){
      print('erorr is $onError');
      emit(SocialCreatPostErrorState());
    });
  }


  void creatPost(
      {
        required String dateTime,
        required String text,
        String? postImage,

      })
  {

    postModel modele=postModel(
      name: modelResgister.name,
      uid: modelResgister.uid ,
      Image: modelResgister.image,
      text:text,
      dateTime: dateTime,
      PostImage: postImage,
        );
    FirebaseFirestore.instance.collection('post').add(modele.tomap()).then((value) {
      emit(SocialCreatPostSucssesState());
    }).catchError((onError){
      emit(SocialCreatPostErrorState());
    });
  }
  void removePostIamge()
  {
    PostIamge=null;
    emit(SocialClosePostImageState());
  }
  
  List<postModel> posts=[];
  List<String> Liks=[];
  void getposts()
  {
    emit(SocialGetpostsLoadingState());
    FirebaseFirestore.instance.collection('post').get().then((value) {
      value.docs.forEach((element) {
        Liks.add(element.id);
        posts.add(postModel.fromjson(element.data()));
      });
      emit(SocialGetpostsSucssesState());
    }).catchError((onError){
      emit(SocialGetpostsErrorState());

    });
  }


  void getLikes(String postid)
  {
    FirebaseFirestore.instance.collection('post').doc(postid).collection('like').doc(modelResgister.uid).
    set({
      'like':true,
    }).then((value) {
      emit(SocialGetLikeSucssesState());
    }).catchError((onError){
      emit(SocialGetLikeErrorState());

    });
  }

   List<ModelResgister> users=[];
  void getUserss()
  {

    users=[];
    emit(SocialGetpostsLoadingState());
    FirebaseFirestore.instance.collection('user').get().then((value) {
      value.docs.forEach((element) {
        if(element.data()['uid'] !=modelResgister.uid) {
          users.add(ModelResgister.fromjson(element.data()));
        }
      });
      emit(SocialGetAllUsersSucssesState());
    }).catchError((onError){
      emit(SocialGetAllUsersErrorState());

    });
  }

  void sendMassage({
  required String receverid,
  required String text,
  required String time,
})
  {
    modelMassage modelmassage=modelMassage(senderid: modelResgister.uid,
        receverid: receverid,
        time: time,
        text: text);
    FirebaseFirestore.instance.collection('user').
    doc(modelResgister.uid).
    collection('chat').
    doc(receverid).collection('massage').add(modelmassage.tomap()).
    then((value) {
      print('here is data : $value');
      emit(SocialSendMassagesucssesState());}).catchError((e){emit(SocialSendMassageErrorState());});


    FirebaseFirestore.instance.collection('user').
    doc(receverid).
    collection('chat').
    doc(modelResgister.uid).collection('massage').add(modelmassage.tomap()).
    then((value) {
      print('here is data : $value');

      emit(SocialreceveMassagesucssesState());}).catchError((e){emit(SocialreceveMassageErrorState());});
  }


  List<modelMassage> massage=[];
  void getmassage({
  required String reciverid,
})
  {
    FirebaseFirestore.instance.
    collection('user').doc(modelResgister.uid).collection('chat').doc(reciverid)
        .collection('massage').orderBy('time').snapshots().listen((event) {
      massage=[];
          print(event);
          event.docs.forEach((element) {
            massage.add(modelMassage.fromjson(element.data()));
          });
          emit(SocialgetMassagesucssedState());

    });
  }

  
}