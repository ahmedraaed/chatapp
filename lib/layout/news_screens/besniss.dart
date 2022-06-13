import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/cubit/news_cubit/news_states.dart';

import '../../cubit/news_cubit/new_cubit.dart';
import '../../sharecomponent/contant.dart';

class BusniessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCuibt,NewsState>(
      listener: (context, state) => {},
      builder:(context,state) {
        var cubit=NewsCuibt.get(context).News;
        return CustomArtical(cubit);

      },
    );
  }
}
