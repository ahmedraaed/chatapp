import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/layout/counter.dart';
import 'package:noteappflutter/social_app/cubit.dart';
import 'package:noteappflutter/social_app/register/bloc_register/model_register.dart';
import 'package:noteappflutter/social_app/screens/chat_room_screen.dart';

import '../states.dart';

class SocialChat extends StatelessWidget {
  const SocialChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocaialCubit,SocialGetUserStates>(
      listener: (context, state) {},
      builder: (context,state)
      {
        return  ConditionalBuilder(
          condition: SocaialCubit.get(context).users.length>0,
          builder: (BuildContext context) { return ListView.separated(itemBuilder: (context, index) => user(SocaialCubit.get(context).users[index],context),
            separatorBuilder: (context,index)=>Container(
              height: 10,
              width: double.infinity,
              color: Colors.black26,
            ),
            itemCount:SocaialCubit.get(context).users.length ,
          ); },
          fallback: (BuildContext context)=>Center(child: CircularProgressIndicator()),

        );
      }

    ) ;
  }
  Widget user(ModelResgister model,context)=>  Padding(
    padding: const EdgeInsets.all(15.0),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomScreen(modelResgister: model),));
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('${model.image}'),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            '${model.name}',
            style: TextStyle(
                fontSize: 18, color: Colors.black),
          ),


        ],
      ),
    ),
  );
}
