import 'dart:io';

import 'package:get_storage/get_storage.dart';

class Database {
    String url = "https://quizu.okoul.com/";
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  Map<String, String> headersWithToken = {
        "Accept": "application/json",
        "Authorization": "Bearer ${GetStorage().read('token')}"
      };
}