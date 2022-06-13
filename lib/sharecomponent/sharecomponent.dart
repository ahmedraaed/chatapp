import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteappflutter/cubit/todo/cubit.dart';

Widget FormOfOst(Map model,context) {
  return Dismissible(
    key:Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 45,
            child: Text(
              "${model['time']}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${model['title']}", style: TextStyle(fontSize: 30)),
                Text(
                  "${model['data']}",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 40,
          ),
          IconButton(onPressed: (){
            AppCubit.get(context).UpdateDataBase(status: "Done", id: model['id']);
          }, icon: Icon(Icons.done,color: Colors.lightBlue,),),
          SizedBox(
            width: 10,
          ),
          IconButton(onPressed: (){
            AppCubit.get(context).UpdateDataBase(status: "Archive", id: model['id']);
          }, icon: Icon(Icons.archive,color: Colors.cyan,),),
        ],
      ),
    ),
    onDismissed: (direction){
      AppCubit.get(context).DeletDatabase(id: model['id']);
    },
  );
}


Widget emptylist()
{
  return Container(
    child: Column(
      children: [
        Icon(Icons.featured_play_list_rounded,color: Colors.lightBlue,),
        SizedBox(height: 10,),
        Text("You Don't have any Tasks",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ],
    ),
  );
}
