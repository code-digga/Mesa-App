import 'package:shared_preferences/shared_preferences.dart';

class PrefsStorage {
  storeData({String? key, String? value}) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key ?? '', value ?? '');
  }

  Future<String?> retrieveData(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
