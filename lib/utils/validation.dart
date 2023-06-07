class Validation {
//sync text fill check
  Future<bool> istextField(String value) async {
    return await Future.delayed(const Duration(seconds: 2),
        () => RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(value));
  }

//sync address check
  Future<bool> ispincode(String value) async {
    return await Future.delayed(const Duration(seconds: 2),
        () => RegExp(r'^[1-9]{1}\d{2}\s?\d{3}$').hasMatch(value));
  }

//sync address check
  Future<bool> isAlphabetField(String value) async {
    return await Future.delayed(const Duration(seconds: 2),
        () => RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(value));
  }

  //sync email check
  Future<bool> isEmailField(String value) async {
    return await Future.delayed(
        const Duration(seconds: 2),
        () => RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value));
  }

  //sync phone check
  Future<bool> isPhoneField(String value) async {
    return await Future.delayed(const Duration(seconds: 2),
        () => RegExp(r'^(?:[+0][1-9])?[0-9]{10}$').hasMatch(value));
  }
}


