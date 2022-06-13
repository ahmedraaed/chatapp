import 'package:noteappflutter/model/shoping_app/model_data.dart';

abstract class ShopLoginStates {}

class ShopInitialState extends ShopLoginStates{}


class ShopLoginLodingState extends ShopLoginStates{}
class ShopLoginSucssesState extends ShopLoginStates{
    ShopLoginData loginData;
  ShopLoginSucssesState({required this.loginData});
}
class ShopLoginErrorState extends ShopLoginStates{
  final String Error;
  ShopLoginErrorState(this.Error);
}

class changeLoginPassowerStat extends ShopLoginStates{}