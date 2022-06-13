import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/cubit/news_cubit/news_states.dart';

import '../../layout/home_layout.dart';
import '../../layout/news_screens/besniss.dart';
import '../../layout/news_screens/secendscreen.dart';
import '../../layout/news_screens/setting.dart';
import '../../layout/news_screens/sportscreen.dart';
import '../../network/remotly/diohelper.dart';

class NewsCuibt extends Cubit<NewsState>
{
  NewsCuibt() :super(NewsInitState());

  static NewsCuibt get(context) => BlocProvider.of(context);


  int currentindex=0;

  List<BottomNavigationBarItem> items=[
    BottomNavigationBarItem(
        icon:Icon(Icons.business_center,),
      label: "Busniess",
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.science),
      label: "Science",
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.sports_baseball),
      label: "Sport",
    ),
  ];
  List<Widget> screen=[
    BusniessScreen(),
    ScienceScreen(),
    SportsScreen(),
    SettingScreen(),
  ];


  void changescreen(index)
  {
    currentindex=index;
    if(currentindex==1)
      getSports();
    if(currentindex==2)
      getScience();
    emit(NavigationButtomBarState());
  }




  List<dynamic> News=[];
   void getBesniess()
  {

    emit(NewsLoadingState());
    DioHealper.getData(
        url: 'v2/everything',
        query: {
          'q':'apple',
          'from':'2022-05-23',
          'to':'2022-05-23',
          'sortBy':'popularity',
          'apiKey':'dd62bba8cb5343ae8149ab44b368e907',
        }
    ).then((value)
    {
      News=value.data['articles'];
      print(News[13]['title']);

      emit(NewsGetBisnussState());

    }).catchError((onError){
      print("error is $onError");
      emit(NewsErorrState(onError.toString()));
    });
  }


  List<dynamic> Sports=[];
  void getSports()
  {
    emit(LoadingSportsState());
    DioHealper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'Sports',
          // 'from':'2022-05-23',
          // 'to':'2022-05-23',
          // 'sortBy':'popularity',
          'apiKey':'dd62bba8cb5343ae8149ab44b368e907',
        }
    ).then((value)
    {
      Sports=value.data['articles'];
      print(News[13]['title']);

      emit(GetSportsState());

    }).catchError((onError){
      print("error is $onError");
      emit(ErorrSportsState(onError.toString()));
    });
  }



  List<dynamic> Science=[];
  void getScience()
  {
    emit(LoadingScienceState());
    DioHealper.getData(
        url: 'v2/everything',
        query: {
          'domains':'wsj.com',
          'apiKey':'dd62bba8cb5343ae8149ab44b368e907',
        }
    ).then((value)
    {
      Science=value.data['articles'];
      print(News[13]['title']);

      emit(GetScienceState());

    }).catchError((onError){
      print("error is $onError");
      emit(ErorrScienceState(onError.toString()));
    });
  }

  List<dynamic> Search=[];
  void getSearch(String value)
  {
    emit(LoadingSearchState());
    DioHealper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
           'from':'2022-04-24',
            'to':'2022-05-25',
           'sortBy':'popularity',
          'apiKey':'dd62bba8cb5343ae8149ab44b368e907',
        }
    ).then((value)
    {
      Search=value.data['articles'];
      print(News[13]['title']);

      emit(GetSearchState());

    }).catchError((onError){
      print("error is $onError");
      emit(ErorrSearchState(onError.toString()));
    });
  }

}