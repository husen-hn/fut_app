import 'dart:convert';

VerifySuccessSchema loginSuccessSchemaFromJson(String str) =>
    VerifySuccessSchema.fromJson(json.decode(str));

class VerifySuccessSchema {
  VerifySuccessSchema({String? detail}) {
    _detail = detail;
  }

  VerifySuccessSchema.fromJson(dynamic json) {
    _detail = json['detail'];
  }
  String? _detail;

  VerifySuccessSchema copyWith({String? detail}) =>
      VerifySuccessSchema(detail: detail ?? _detail);
  String? get detail => _detail;
}
