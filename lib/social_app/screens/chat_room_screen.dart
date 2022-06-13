import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/social_app/cubit.dart';
import 'package:noteappflutter/social_app/massage_model.dart';
import 'package:noteappflutter/social_app/register/bloc_register/model_register.dart';

import '../states.dart';

class ChatRoomScreen extends StatelessWidget {
  ModelResgister? modelResgister;
  ChatRoomScreen({this.modelResgister});

  TextEditingController massagecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Builder(builder: (context) {
      SocaialCubit.get(context).getmassage(reciverid: modelResgister!.uid);
      return BlocConsumer<SocaialCubit,SocialGetUserStates>(
        listener: (context, state) {},
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.indigo,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('${modelResgister!.image}'),
                  ),
                  SizedBox(width: 10,),
                  Text('${modelResgister!.name}',),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder:(context, index) {
                          if(SocaialCubit.get(context).modelResgister.uid == SocaialCubit.get(context).massage[index].senderid)
                            {
                               return sender(SocaialCubit.get(context).massage[index]);

                            }
                          return reciver(SocaialCubit.get(context).massage[index]);

                        },
                        separatorBuilder: (context,index)=>Container(child: SizedBox(height: 10,)),
                        itemCount: SocaialCubit.get(context).massage.length),
                  ),
                  Spacer(),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                              controller: massagecontroller,
                              decoration: InputDecoration(
                                hintText: 'Write massage',
                                border: InputBorder.none,
                              ),
                            )),
                        Container(color: Colors.deepPurple,
                            child: MaterialButton(onPressed: (){
                              SocaialCubit.get(context).sendMassage(receverid: modelResgister!.uid,
                                  text: massagecontroller.text, time: DateTime.now().toString());
                              massagecontroller.clear();
                            },minWidth: 1,
                              child: Icon(Icons.send,color: Colors.white,size: 18,),))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },);

  }
  Widget sender(modelMassage model)=> Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),

      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),)
      ),
      child: Text(model.text,style: TextStyle(color: Colors.black,fontSize: 20),),
    ),
  );

  Widget reciver(modelMassage model)=> Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),

      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            topLeft: Radius.circular(15),)
      ),
      child: Text(model.text,style: TextStyle(color: Colors.black,fontSize: 20),),
    ),
  );

}
