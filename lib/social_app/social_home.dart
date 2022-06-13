import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/cubit/news_cubit/news_states.dart';
import 'package:noteappflutter/social_app/screens/addpost_screen.dart';
import 'package:noteappflutter/social_app/states.dart';

import 'cubit.dart';

class SocialHomeScreen extends StatelessWidget {
  const SocialHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocaialCubit,SocialGetUserStates>(
      listener: (context, state) {},
      builder: (context,state)
      {
        var cubit=SocaialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.Socialtittels[cubit.currentindex],style: TextStyle(color: Colors.black),),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
            ],
          ),
          body: cubit.SocialScreens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black12,
            selectedItemColor: Colors.indigo,
            currentIndex: cubit.currentindex,
            onTap: (index)
            {
              cubit.changescreens(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.chat),label: 'Chat'),
              BottomNavigationBarItem(icon: Icon(Icons.location_on),label: 'Location'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),

            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddPostScreen(),));
            },
            child: Text('+post'),
          ),
        );
      },
    );
  }
}
