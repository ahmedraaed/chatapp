import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/news_cubit/new_cubit.dart';
import '../../cubit/news_cubit/news_states.dart';
import '../../sharecomponent/contant.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCuibt,NewsState>(
      listener: (context, state) => {},
      builder:(context,state) {
        var cubit=NewsCuibt.get(context).Sports;
        return CustomArtical(cubit);
      },
    );
  }

}

