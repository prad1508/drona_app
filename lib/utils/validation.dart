class Validation {
//sync text fill check
  Future<bool> istextField(String value) async {
    return await Future.delayed(Duration(seconds: 2),
        () => RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(value));
  }

  //sync email check
  Future<bool> isEmailField(String value) async {
    return await Future.delayed(
        Duration(seconds: 2),
        () => RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value));
  }

  //sync email check
  Future<bool> isPhoneField(String value) async {
    return await Future.delayed(Duration(seconds: 2),
        () => RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(value));
  }
}
