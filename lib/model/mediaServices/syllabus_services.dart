import 'dart:io';

import 'package:http/http.dart'as http;
import 'package:viit/model/api/api_status.dart';
import 'package:viit/model/syllabus_content_model.dart';

import '../../constants.dart';

class SyllabusContentServices {
  static Future<Object> getSyllabus(String url) async {
    try {
      var res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        
        return Success(res.statusCode, syllabusContentFromJson(res.body));
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