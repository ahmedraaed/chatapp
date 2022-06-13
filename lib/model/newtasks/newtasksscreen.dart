import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/cubit/todo/appstates.dart';
import 'package:noteappflutter/cubit/todo/cubit.dart';

import '../../sharecomponent/contant.dart';
import '../../sharecomponent/sharecomponent.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = AppCubit.get(context);
        return cubit.newtasks.length == 0
            ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Icon(
                      Icons.list_sharp,
                      color: Colors.blue,
                      size: 100,
                    ),
                    Text(
                      "you don't have tasks ",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),
                    ),
                  ],
                ),
            )
            : ListView.separated(
                itemBuilder: (context, index) =>
                    FormOfOst(cubit.newtasks[index], context),
                separatorBuilder: (context, index) => Container(
                  height: 10,
                  color: Colors.black12,
                ),
                itemCount: cubit.newtasks.length,
              );
      },
    );
  }
}
