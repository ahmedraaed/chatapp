import 'package:shared_preferences/shared_preferences.dart';

class sharepref
{
  static late SharedPreferences sharedPreferences;


  static  init()async
  {
    sharedPreferences= await SharedPreferences.getInstance();
  }

   static dynamic getData({
     required String key,
 })
   {
     return  sharedPreferences.get(key);
   }

  static Future<bool> SaveData({
  required String key,
    required dynamic value,
})
  {
    if(value is String) return sharedPreferences.setString(key, value);
    if(value is int) return sharedPreferences.setInt(key, value);
    if(value is double) return sharedPreferences.setDouble(key, value);

    return sharedPreferences.setBool(key, value);


  }

  static Future<bool> RmoveData({required String key})async
  {
    return await sharedPreferences.remove(key);
  }

}