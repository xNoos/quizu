import 'package:get_storage/get_storage.dart';

saveUserData (data) {
  GetStorage storage = GetStorage();
  storage.write('mobile', data['mobile']);
  storage.write('name', data['name']);
  storage.write('token', data['token']);
}