import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/social_app/cubit.dart';
import 'package:noteappflutter/social_app/post_model.dart';

import '../states.dart';

class SocialFeeds extends StatelessWidget {
  const SocialFeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<SocaialCubit,SocialGetUserStates>(
      listener: (context, state) {},
      builder: (context,state) {
        return ConditionalBuilder(
          condition:SocaialCubit.get(context).posts.length > 0 ,
          builder: (context) =>Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    clipBehavior: Clip.hardEdge,
                    elevation: 15,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Stack(
                      children: [
                        Image(
                          image: NetworkImage(
                            'https://img.freepik.com/free-photo/photo-delighted-cheerful-afro-american-woman-with-crisp-hair-points-away-shows-blank-space-happy-advertise-item-sale-wears-orange-jumper-demonstrates-where-clothes-shop-situated_273609-26392.jpg?w=1060',
                          ),
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                'Communicat with Friends',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                  ),
                  ListView.separated(shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => postCard(SocaialCubit.get(context).posts[index],context,index),
                      separatorBuilder: (context, index) => SizedBox(height: 10,),
                      itemCount:SocaialCubit.get(context).posts.length )
                ],
              ),
            ),

          ),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      }
        );



  }
  Widget postCard(postModel post,context,index)=>Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('${post.Image}'),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${post.name}',
                          style: TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.indigo,
                          size: 15,
                        ),
                      ],
                    ),
                    Text(
                      '${post.dateTime}',
                      style: TextStyle(
                          fontSize: 13, color: Colors.black26),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
                iconSize: 17,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            width: double.infinity,
            color: Colors.black26,
            height: 1,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${post.text}',
            style: TextStyle(
              fontSize: 20,

            ),
          ),
          SizedBox(
            height: 5,
          ),
          // Container(
          //   width: double.infinity,
          //   child: Wrap(
          //     children: [
          //       MaterialButton(
          //         onPressed: () {},
          //         child: Text(
          //           'developer',
          //           style: TextStyle(color: Colors.indigo),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                      '${post.PostImage}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
            child: Row(
              children: [
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(Icons.favorite,color: Colors.black26,),
                      Text('0 Likes',style: TextStyle(color: Colors.indigo),),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(Icons.comment,color: Colors.black26,),
                      Text('0 comments',style: TextStyle(color: Colors.indigo),),
                    ],
                  ),
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              color: Colors.black12,
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    '${SocaialCubit.get(context).modelResgister.image}',
                  ),
                ),
                SizedBox(width: 40,),
                InkWell(onTap: (){},child: Text('Write Comments',style: TextStyle(color: Colors.black26),)),
                Spacer(),
                InkWell(
                  onTap: (){},
                  child: InkWell(
                    onTap: (){
                      SocaialCubit.get(context).getLikes(SocaialCubit.get(context).Liks[index]);
                    },
                    child: Row(

                      children: [
                        Icon(Icons.favorite,color: Colors.black26,),
                        Text('Like',style: TextStyle(color: Colors.indigo),),
                      ],
                    ),
                  ),
                ),




              ],
            ),
          ),
        ],
      ),
    ),
  );

}
