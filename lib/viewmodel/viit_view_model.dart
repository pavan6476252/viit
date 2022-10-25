import 'package:flutter/cupertino.dart';
import 'package:viit/model/api/api_status.dart';
import 'package:viit/model/viit_main_model.dart';

import '../model/mediaServices/viit_main_services.dart';

class ViitViewModel extends ChangeNotifier {
  ViitViewModel() {
    getViitApi();
  }

  bool _isLoading = false;
  ViitApiModel? _listViitApiModel;
  UserError? _userError;

  bool get isLoading => _isLoading;
  UserError? get getUserError => _userError;
  ViitApiModel? get getViitApiModel => _listViitApiModel;

  setUserError(UserError userError) {
    _userError = userError;
  }

  setLoading(v) {
    _isLoading = v;
    notifyListeners();
  }

  setViitApiModel(ViitApiModel viitList) async {
    _listViitApiModel = viitList;
  }

  getViitApi() async {
    setLoading(true);

    var response = await ViitMainServices.getViitHome();
    if (response is Success) {
      setViitApiModel(response.response as ViitApiModel);
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
