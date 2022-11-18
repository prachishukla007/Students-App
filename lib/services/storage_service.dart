import 'package:injectable/injectable.dart';
import 'package:student_ui/services/shared_preference.dart';

@singleton
class StorageService {
  StorageService(this._preferences);

  final Preferences _preferences;

  static const phone = "phoneNumber";

  Future<String> getPhoneNo() async => await _preferences.getString(phone);

  Future setPhoneNo(String value) async {
    await _preferences.setString(phone, value);
  }
}