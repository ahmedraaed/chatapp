import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/cubit/news_cubit/new_cubit.dart';
import 'package:noteappflutter/cubit/news_cubit/news_states.dart';
import 'package:noteappflutter/sharecomponent/contant.dart';

class SeaerxhScreen extends StatelessWidget {

  var searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCuibt,NewsState>(
      listener:  (context, state) {},
      builder: (context,state)
      {
        var artical=NewsCuibt.get(context).Search;
        return Scaffold(
          appBar: AppBar(
            title: Text("Search",style: TextStyle(color: Colors.black),),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller:  searchcontroller,
                  keyboardType:TextInputType.text ,
                  onChanged: (value)
                  {
                    NewsCuibt.get(context).getSearch(value);

                  },
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return 'search must not empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(

                    labelText: "Search",
                    prefixIcon: Icon(Icons.search),

                  ),
                ),
              ),
              Expanded(child: CustomArtical(artical)),

            ],
          ),
        );
      },

    );
  }
}
