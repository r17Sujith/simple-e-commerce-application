
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  String keySelectedLocation = "key_SelectedLocation";
  String keySections = "key_Sections";

  static late SharedPreferences _sharedPrefs;

  init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  String? get selectedLocation => _sharedPrefs.getString(keySelectedLocation);

  set selectedLocation(String? value) {
    _sharedPrefs.setString(keySelectedLocation, value!);
  }

  String? get selectedSection => _sharedPrefs.getString(keySections);

  set selectedSection(String? value) {
    _sharedPrefs.setString(keySections, value!);
  }

  removeKey(String key) {
    _sharedPrefs.remove(key);
  }
}



final sharedPrefs = SharedPrefs();
