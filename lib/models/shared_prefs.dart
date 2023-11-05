import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

initPrefs() async {
  prefs = await SharedPreferences.getInstance();
  
}
