import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getUserToggle() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return (prefs.getBool('save_user_toggle') ?? false);
}
