class Validators {
  get validateEmail {
    var validator = ((String email) {
      if (email != null) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (regex.hasMatch(email))
          return null;
        else
          return 'Entre com um email válido';
      } else {
        return null;
      }
    });
    return validator;
  }

  validatePassword(String oldPassword) {
    var validator = ((String password) {
      if (password != oldPassword) {
        return "Senhas não conferem";
      } else {
        return null;
      }
    });
    return validator;
  }
}
