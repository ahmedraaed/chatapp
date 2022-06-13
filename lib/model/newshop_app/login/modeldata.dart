// class NewModelData {
//     late bool status;
//     late String message;
//     Data? data;
//
//
//   NewModelData()
//   {
//     this.status;
//     this.message;
//     this.data;
//   }
//   NewModelData.fromjson(Map<String,dynamic> json)
//   {
//     status=json['status'];
//     message=json['message'];
//     data=Data.fromjson(json['data']);
//
//
//   }
// }
//
// class Data
// {
//   late int id;
//   late String name;
//   String? email;
//   String? phone;
//   String? image;
//   int? points;
//   int? credit;
//   String? token;
//
//   Data.fromjson(Map<String,dynamic> json)
//   {
//     id=json['id'];
//     id=json['name'];
//     id=json['email'];
//     id=json['phone'];
//     id=json['image'];
//     id=json['points'];
//     id=json['credit'];
//     id=json['token'];
//
//
//   }
// }
//
class ModelData {
  bool? status;
  String? message;
  Data? data;

  ModelData({this.status, this.message, this.data});

  ModelData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.points,
        this.credit,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['points'] = this.points;
    data['credit'] = this.credit;
    data['token'] = this.token;
    return data;
  }
}
