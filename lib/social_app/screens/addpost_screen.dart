import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/social_app/cubit.dart';

import '../states.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocaialCubit,SocialGetUserStates>(
      listener: (context, state){},
      builder: (context, state){
        var postController=TextEditingController();
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
            },icon: Icon(Icons.arrow_back_ios_sharp)),
            title:Text('Add Post'),
            actions: [
              TextButton(onPressed: (){
                if(SocaialCubit.get(context).PostIamge==null)
                {
                  SocaialCubit.get(context).creatPost(dateTime: DateTime.now().toString(), text: postController.text);
                }else{
                  SocaialCubit.get(context).UpdatePostIamge(dateTime: DateTime.now().toString(), text: postController.text);
                }
              }, child: Text('Post'))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/horizontal-shot-happy-asian-woman-stands-with-closed-eyes-smiles-tenderly-wears-pink-vest-warm-winter-mittens-ad-hat-giggles-positively-isolated-white-background-positive-emotions-concept_273609-58900.jpg?w=900',
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: [
                        Text(
                          'Ahmed Raaed',
                          style: TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                        Text(
                          DateTime.now().toString(),
                          style: TextStyle(
                              fontSize: 13, color: Colors.black26),
                        ),

                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: TextFormField(
                      controller: postController,
                      decoration: InputDecoration(
                    hintText: 'write Yor post',
                  )),
                ),
                if(SocaialCubit.get(context).PostIamge != null)
                       Stack(
                        children: [
                          Container(
                            alignment: AlignmentDirectional.topEnd,
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image:  FileImage(SocaialCubit.get(context).PostIamge!) ,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.indigo,
                                child: IconButton(
                                  onPressed: (){SocaialCubit.get(context).removePostIamge();
                                    },
                                  icon: Icon(Icons.close),color: Colors.white,)),
                          ),
                        ],
                      ),

                Row(
                    children: [
                      TextButton(
                        onPressed: (){
                          SocaialCubit.get(context).GetPostIamge();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.photo),
                            Text('Photo'),

                          ],
                        ),
                      ),
                      Spacer(),
                      Text('#tags'),

                    ]),
              ],
            ),
          ),
        );
      },

    );

  }
}
