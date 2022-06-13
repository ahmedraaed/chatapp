
class ModelResgister
{
  late String name;
  late String email;
  late String phone;
  late String uid;
  String? bio;
  String? image;
  String? cover;
   bool verfication=false;

  ModelResgister({
   required this.email,required this.name,required this.phone,required this.uid,this.bio,this.image,this.cover
});
  ModelResgister.fromjson(Map<String,dynamic> json)
  {
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    uid=json['uid'];
    bio=json['bio'];
    image=json['image'];
    cover=json['cover'];
    verfication=json['verfication'];
  }
  Map<String,dynamic> tomap()
  {
    return{
      'name':name,
      'email':email,
      'phone':phone,
      'uid':uid,
      'bio':bio,
      'image':image,
      'cover':cover,
      'verfication':verfication,
    };
  }
}