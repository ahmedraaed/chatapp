import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/model/newshop_app/login/bloc/cubit.dart';
import 'package:noteappflutter/model/newshop_app/login/login_screen.dart';
import 'package:noteappflutter/model/newshop_app/newshop_screen/bloc/states.dart';
import 'package:noteappflutter/sharecomponent/shareprefrances.dart';

import 'bloc/cubit.dart';

class NewShoHome_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewShopHomeCubit,NewShopHomeStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit=NewShopHomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: cubit.ShopScreen[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.deepPurple,
            onTap: (index)
            {
              print(index);
              cubit.changeNavbottom(index);
            },

            items: [

              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Product',),
              BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Product',),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Product',),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Product',),

            ],
          ),

        );
      }

    );
  }
}
