

class ModelHome
{
  bool? status;
  HomeDataModel? data;

  ModelHome.fromjson(Map<String,dynamic> json)
  {
    status=json['status'];
    data=HomeDataModel.fromjson(json['data']);
  }

}
class HomeDataModel
{
  List<Banner>banners=[];
  List<Product>products=[];

  HomeDataModel.fromjson(Map <String,dynamic> json )
  {
    json['banners'].forEach((element)
  {
    banners.add(Banner.fromjson(element));
  });
    json['products'].forEach((element)
    {
      products.add(Product.fromjson(element));
    });
  }

}

class Banner
{
  late int id;
  late String image;
  Banner.fromjson(Map<String,dynamic> json)
  {
    id=json['id'];
    image=json['image'];
  }

}
class Product
{
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavourit;
  bool? inCart;

  Product.fromjson(Map<String,dynamic> json)
  {
    id=json['id'];
    price=json['price'];
    oldPrice=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    inFavourit=json['in_favorites'];
    inCart=json['in_cart'];


  }
}