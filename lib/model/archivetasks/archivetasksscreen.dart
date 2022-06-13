import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/todo/appstates.dart';
import '../../cubit/todo/cubit.dart';
import '../../sharecomponent/sharecomponent.dart';

class ArchiveTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state) {
      },
      builder: (BuildContext context, Object? state) {

        var cubit=AppCubit.get(context);
        return cubit.archivetasks.length == 0
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

          itemBuilder: (context, index) => FormOfOst(cubit.archivetasks[index],context),
          separatorBuilder:(context,index) => Container(
            height: 10,
            color: Colors.black12,
          ),
          itemCount: cubit.archivetasks.length,
        );
      },
    );
  }
}
