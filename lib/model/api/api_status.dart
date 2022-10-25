

class Success {
  int code;
  Object response;
  Success(this.code, this.response);
}

class Failure {
  int code;
  Object errorResposne;
  Failure(this.code, this.errorResposne);
}
