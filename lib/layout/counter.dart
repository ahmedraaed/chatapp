import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/cubit/countercubit/counterstates.dart';
import 'package:noteappflutter/cubit/countercubit/cubit.dart';

class counter extends StatelessWidget {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (BuildContext context, state) {
          if(state is CounterMinusState)
            {
              print(state.count);

            }else if (state is CounterPlussState)
              {
                print(state.count);

              }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(title: Text("Conter"),),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.black,

                    child: MaterialButton(onPressed: () {
                      CounterCubit.get(context).pluss();
                    }),
                  ),
                  SizedBox(width: 5,),
                  Text("${CounterCubit.get(context).count}"),
                  SizedBox(width: 5,),
                  Container(
                    color: Colors.black26,
                    child: MaterialButton(onPressed: () {
                      CounterCubit.get(context).minus();
                    }),
                  ),
                ],
              ),
            ),
          );

        },
      ),
    );
  }
}

