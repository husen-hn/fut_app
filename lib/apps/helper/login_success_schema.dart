import 'dart:convert';

LoginSuccessSchema loginSuccessSchemaFromJson(String str) =>
    LoginSuccessSchema.fromJson(json.decode(str));

class LoginSuccessSchema {
  LoginSuccessSchema({String? message, int? code}) {
    _message = message;
    _code = code;
  }

  LoginSuccessSchema.fromJson(dynamic json) {
    _message = json['message'];
    _code = json['code'];
  }
  String? _message;
  int? _code;

  LoginSuccessSchema copyWith({String? message, int? code}) =>
      LoginSuccessSchema(
        message: message ?? _message,
        code: code ?? _code,
      );
  String? get message => _message;
  int? get code => _code;
}
