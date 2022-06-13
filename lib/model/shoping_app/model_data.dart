class ShopLoginData
{
  late bool status;
   late String message;
  UserData? data;

  ShopLoginData.Fromjson(Map<String,dynamic> json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data'] !=null?UserData.FromJson(json['data']):null;
}

}
class UserData
{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;


  UserData.FromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    points=json['points'];
    token=json['token'];
    credit=json['credit'];

  }
}