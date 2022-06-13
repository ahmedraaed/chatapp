import 'package:shared_preferences/shared_preferences.dart';

class CachHealper
{


  static late SharedPreferences sharedprefrance;


  static init()async
  {
    return  sharedprefrance= await SharedPreferences.getInstance();
  }


  static Future<bool> PutBoolData({
  required String key,
    required bool value,
})async
  {
    return await sharedprefrance.setBool(key, value);
  }

  static bool? GetBoolData (
      {

        required String key,

      })
    {
    return sharedprefrance.getBool(key);
    }
}

