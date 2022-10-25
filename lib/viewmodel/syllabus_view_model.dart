import 'package:flutter/cupertino.dart';
import 'package:viit/model/api/api_status.dart';
import 'package:viit/model/mediaServices/syllabus_services.dart';
import 'package:viit/model/syllabus_content_model.dart';

class SyllabusViewModel extends ChangeNotifier {
 

  bool _isLoading = false;
  SyllabusContent? _listSyllabusApiModel;
  UserError? _userError;

  bool get isLoading => _isLoading;
  UserError? get getUserError => _userError;
  SyllabusContent? get getSyllabusApiModel => _listSyllabusApiModel;

  setUserError(UserError userError) {
    _userError = userError;
  }

  setLoading(v) {
    _isLoading = v;
    notifyListeners();
  }

  setSyllabusApiModel(SyllabusContent viitList) async {
    _listSyllabusApiModel = viitList;
  }

  getSyllabusApi(String url) async {
    setLoading(true);

    var response = await SyllabusContentServices.getSyllabus(url);
    if (response is Success) {
      setSyllabusApiModel(response.response as SyllabusContent);
    }
    if (response is Failure) {
      UserError userError = UserError(response.code, response.errorResposne);
      setUserError(userError);
    }
    setLoading(false);
  }
}

class UserError {
  int code;
  Object userError;
  UserError(this.code, this.userError);
}