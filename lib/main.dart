import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/cubit/news_cubit/new_cubit.dart';
import 'package:noteappflutter/cubit/todo/appstates.dart';
import 'package:noteappflutter/cubit/todo/cubit.dart';
import 'package:noteappflutter/model/newshop_app/login/bloc/cubit.dart';
import 'package:noteappflutter/model/shoping_app/cubit_shoping/block_shoping.dart';
import 'package:noteappflutter/sharecomponent/contant.dart';
import 'package:noteappflutter/sharecomponent/shareprefrances.dart';
import 'package:noteappflutter/social_app/cubit.dart';
import 'package:noteappflutter/social_app/login/social-login_screen.dart';
import 'package:noteappflutter/social_app/social_home.dart';
import 'package:noteappflutter/them/themapp.dart';
import 'model/newshop_app/login/login_screen.dart';
import 'model/newshop_app/newshop_screen/home_screen.dart';
import 'model/newshop_app/ob_bording/onbording_screen.dart';
import 'network/remotly/diohelper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  DioHealper.init();
 await sharepref.init();
 //bool onbor=sharepref.getData(key: 'onbording');
 token=sharepref.getData(key: 'token');
 uid=sharepref.getData(key: 'uid');

  dynamic newonbording=sharepref.getData(key: 'newonbording');
 print(newonbording);
 //print(onbor);


  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  //
  // Widget window()
  // {
  //   if(sharepref.getData(key: "onbording")!=null)
  //     {
  //       if(sharepref.getData(key: "token")!=null)
  //         {
  //           return Shop_Layout();
  //         }else
  //           {
  //             return LoginScreenSop();
  //
  //           }
  //     }else
  //       {
  //         return OnBordingShopingScreen();
  //       }
  // }

// Widget Windo()
// {
//   if(sharepref.getData(key: 'newonbording')!=null)
//     {
//       if(sharepref.getData(key: 'token')!=null) {
//         return NewShoHome_Screen();
//       } else
//         {
//           return Login_Screen();
//         }
//
//     }else
//       {
//         return OnBourding_Screen();
//       }
// }




Widget Startwidget()
{
  if(uid !=null)
    {
     return SocialHomeScreen();
    }else
      {
        return SocialOginScreen();
      }
}

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context) { return NewsCuibt()..getBesniess()..getSports()..getScience();},
        ),
        BlocProvider(
        create: (BuildContext context) => AppCubit(),),
        BlocProvider(
            create: (BuildContext context) => ShopHomeCubit()..getHomData(),),
        BlocProvider(
            create: (BuildContext context) => SocaialCubit()..getvireficatio()..getposts()..getUserss(),),
     //   BlocProvider(create: (BuildContext context) => NewShopHomeCubit()..getallHomeData(),)
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) => {},
        builder: (context,state)
        {
          return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightmode,
        darkTheme: darkmode,
       themeMode: ThemeMode.light,
       // themeMode:AppCubit.get(context).isdark?ThemeMode.dark:ThemeMode.light,
      color: Colors.white,
        home: SocialOginScreen(),
          );

        },
      ),
    );
  }
}

