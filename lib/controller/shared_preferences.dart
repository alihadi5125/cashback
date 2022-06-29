import 'package:shared_preferences/shared_preferences.dart';
class SharePrefs{
 static  SharedPreferences? prefs;
static Future<void> init() async {
  prefs=await SharedPreferences.getInstance();
}

}