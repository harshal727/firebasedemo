import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static GetStorage getStorage = GetStorage();

  static setUserName(var email, String uid) async {
    // await getStorage.write("firstname", firstname);
    // await getStorage.write("lastname", lastname);
    //
    // await getStorage.write("gender", gender);
    await getStorage.write("email", email);
    await getStorage.write("uid", uid);
  }

  static getFirst() {
    return getStorage.read('username');
  }

  static getUid() {
    return getStorage.read('uid');
  }

  // static getLast() {
  //   return getStorage.read('username');
  // }
  //
  //
  //
  // static getGender() {
  //   return getStorage.read('username');
  // }
  static getEmail() {
    return getStorage.read('username');
  }

  static getUserName() {
    return getStorage.read('username');
  }

  static Future getClear() async {
    return getStorage.erase();
  }

  // static clear() {
  //   return getStorage.erase();
  // }
}
