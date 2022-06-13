import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappflutter/model/shoping_app/cubit_shoping/states.dart';
import 'package:noteappflutter/model/shoping_app/shop_layout/model_home.dart';

import '../cubit_shoping/block_shoping.dart';

class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit,ShopingHomeStates>(
        listener: (context, state) => {},
        builder: (context,state)=>ConditionalBuilder(
            condition: ShopHomeCubit.get(context).modelHome != null,
            builder: (context)=>ProductCarousalSlaider(ShopHomeCubit.get(context).modelHome!),
            fallback:(context) => Center(child: CircularProgressIndicator()), ),
    );

  }
  Widget ProductCarousalSlaider(ModelHome model)
  {
    return Column(
      children: [
        CarouselSlider(items: model.data!.banners.map((e) {
          return Image(image: NetworkImage('${e.image}'),
          width: double.infinity,
          fit: BoxFit.cover,
          );
        }).toList(), options: CarouselOptions(
          height: 200,
          autoPlay: true,
          autoPlayAnimationDuration:Duration(seconds: 2),
          autoPlayCurve: Curves.easeInOut,
          autoPlayInterval: Duration(seconds: 4),
          initialPage: 0,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          reverse: false,
          viewportFraction: 1

        ),
        ),
      ],
    );
  }
}
