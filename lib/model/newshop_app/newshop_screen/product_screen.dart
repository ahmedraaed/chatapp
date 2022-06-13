import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/model/newshop_app/login/bloc/cubit.dart';
import 'package:noteappflutter/model/newshop_app/newshop_screen/bloc/cubit.dart';
import 'package:noteappflutter/model/newshop_app/newshop_screen/bloc/states.dart';

class NewProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewShopHomeCubit,NewShopHomeStates>(
      listener: (context, state) {},
      builder: (context,state)
      {
        var cubit=NewShopHomeCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
              FloatingActionButton(onPressed: (){cubit.getallHomeData();},child: Icon(Icons.add,),),
            ],
          ),
        );
      },

    );
  }
}
