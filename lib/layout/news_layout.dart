import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/cubit/news_cubit/new_cubit.dart';
import 'package:noteappflutter/cubit/todo/cubit.dart';
import 'package:noteappflutter/sharecomponent/contant.dart';

import '../cubit/news_cubit/news_states.dart';
import 'news_screens/search_screen.dart';

class NewsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //var cubit=NewsCuibt.get(context);

        return BlocConsumer<NewsCuibt,NewsState>(
          listener: (context, state) {},
          builder:(context,state){
            var cuibt= NewsCuibt.get(context);
            return  Scaffold(
            appBar: AppBar(
            title: Text("News App",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),) ,
            actions: [
              IconButton(onPressed: (){
                Navigat(context, SeaerxhScreen(),);
              }, icon:Icon(Icons.search,size: 30)),
            ],),
            body: cuibt.screen[cuibt.currentindex],
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                AppCubit.get(context).changemodeapp();
              },
              child: Icon(Icons.brightness_medium),

            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
            currentIndex: NewsCuibt.get(context).currentindex,
            onTap: (index){NewsCuibt.get(context).changescreen(index);},
            items:cuibt.items,
            ),
            );

          },
        );

  }
}
