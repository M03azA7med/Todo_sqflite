import 'package:shared_preferences/shared_preferences.dart';

class CachHelper{
  // static sharedPreferences= SharedPreferences.getInstance();
  static SharedPreferences  sharedPreferences = SharedPreferences .getInstance()as SharedPreferences;

   static  init()
   async{

    sharedPreferences = await SharedPreferences .getInstance();
  }

  static Future<bool> putDate( {
    required String key,
    required bool value
}) async
  {
   return await sharedPreferences.setBool(key, value);
  }


  static bool? getDate( {
    required String key,

  })
  {
    return sharedPreferences.getBool(key);
  }
}