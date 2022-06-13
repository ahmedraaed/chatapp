import 'package:noteappflutter/model/newshop_app/login/modeldata.dart';

abstract class NewShopLoginStates {}



class NewShopInitState extends NewShopLoginStates{}

class NewShopLoadingState extends NewShopLoginStates{}

class NewShopSucssesState extends NewShopLoginStates{
  final ModelData? newmodeldata;
  NewShopSucssesState(this.newmodeldata);
}

class NewShopErrorState extends NewShopLoginStates{
  final String Error;
  NewShopErrorState(this.Error);
}
class ChangepassIcon extends NewShopLoginStates{}