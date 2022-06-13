import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/model/shoping_app/cubit_shoping/block_shoping.dart';
import 'package:noteappflutter/model/shoping_app/cubit_shoping/states.dart';
import 'package:noteappflutter/model/shoping_app/shop_layout/search_screen.dart';
import 'package:noteappflutter/sharecomponent/contant.dart';


class Shop_Layout extends StatelessWidget {
  const Shop_Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit,ShopingHomeStates>(
      listener: (context, state) => {},
      builder:(context,state){
        var cubit = ShopHomeCubit.get(context);
        return Scaffold(appBar: AppBar(title: Text('Shop',style:TextStyle(color: Colors.black54) ,),
        actions: [
          IconButton(onPressed: (){Navigat(context, SearchScreen(),);}, icon: Icon(Icons.search),),
        ],),
          body: cubit.ShopScreen[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.ChangeScreen(index);
            },
            currentIndex: cubit.currentindex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: "Category",),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favourit",),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting",),

            ],
          ),
        );
      },

    );
  }
}
