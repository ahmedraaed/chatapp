
class modelMassage
{
  late String receverid;
  late String senderid;
  late String time;
  late String text;


  modelMassage({
   required this.senderid,required this.receverid,required this.time,required this.text
});
  modelMassage.fromjson(Map<String,dynamic> json)
  {
    receverid=json['receverid'];
    senderid=json['senderid'];
    time=json['time'];
    text=json['text'];
  }
  Map<String,dynamic> tomap()
  {
    return{
      'receverid':receverid,
      'senderid':senderid,
      'time':time,
      'text':text,

    };
  }
}