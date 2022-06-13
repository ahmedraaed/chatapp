
class postModel
{
  late String name;
  late String uid;
  String? Image;
  String? dateTime;
  String? text;
  String? PostImage;

  postModel({
  required this.name,required this.uid,this.Image,this.dateTime,this.text,this.PostImage
  });
  postModel.fromjson(Map<String,dynamic> json)
  {
    name=json['name'];
    uid=json['uid'];
    Image=json['Image'];
    dateTime=json['dateTime'];
    text=json['text'];
    PostImage=json['PostImage'];
  }
  Map<String,dynamic> tomap()
  {
    return{
      'name':name,
      'uid':uid,
      'Image':Image,
      'dateTime':dateTime,
      'text':text,
      'PostImage':PostImage,
    };
  }
}