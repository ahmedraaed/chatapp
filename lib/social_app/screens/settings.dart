import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/social_app/screens/update_screen.dart';

import '../cubit.dart';
import '../states.dart';

class SocialSetting extends StatelessWidget {
  const SocialSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocaialCubit,SocialGetUserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=SocaialCubit.get(context).modelResgister;
        return Scaffold(

          body: Padding(
            padding: const EdgeInsets.fromLTRB(14,5,14,5),
            child: Column(
              children: [
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children:[
                      Align(
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage('${cubit.cover}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child:CircleAvatar(
                          backgroundImage: NetworkImage('${cubit.image}'),
                          radius: 40,
                        ),
                      ),

                    ] ,
                  ),
                ),
                Container(alignment: AlignmentDirectional.centerStart,child: Text('${cubit.name}',style: TextStyle(fontSize: 25),)),
                Container(alignment: AlignmentDirectional.centerStart,child: Text('${cubit.bio}',style: Theme.of(context).textTheme.caption,)),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                            Text('post',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),


                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                            Text('photos',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),


                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                            Text('Follower',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),


                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text('100',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                            Text('Followings',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Container(width: 240,child: MaterialButton(onPressed: (){},color: Colors.deepPurple,child: Text('Add Photo',style: TextStyle(color: Colors.white),))),
                    SizedBox(width: 30,),

                    OutlinedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(),));
                    },
                      child: Icon(Icons.edit),),
                  ],
                ),


              ],
            ),
          ),
        );
      },
    );
  }
}
