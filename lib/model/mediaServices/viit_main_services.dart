import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:viit/model/api/api_status.dart';
import 'package:viit/model/viit_main_model.dart';
import '../../constants.dart';

class ViitMainServices {
  static Future<Object> getViitHome() async {
    try {
      var res = await http.get(Uri.parse(BASE_URL));

      if (res.statusCode == 200) {
        
        return Success(res.statusCode, viitApiModelFromJson(res.body));
      }
      return Failure(res.statusCode, "IVANLID RESPOSNSE");
    } on HttpException {
      return Failure(NO_INTERNET, 'No Internet Connection');
    } on SocketException {
      return Failure(NO_INTERNET, 'No Internet Connection');
    } on FormatException {
      return Failure(INVALID_FORMAT, 'Invalid Format');
    } catch (e) {
      return Failure(UNKNOWN_ERROR, 'Unknown Error');
    }
  }
}
