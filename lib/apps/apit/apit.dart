import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fut_app/apps/app/app_repository.dart';
import 'package:fut_app/apps/helper/login_success_schema.dart';
import 'package:fut_app/apps/helper/status_error_handler_schema.dart';
import 'package:fut_app/apps/helper/verify_success_schema.dart';

class Apit {
  Future<Either<StatusErrorHandlerSchema, LoginSuccessSchema>> login(
      AppRepository appRepository,
      String contactInfo,
      String deviceName) async {
    try {
      var response =
          await appRepository.dio.post('/auth/api/v1/auth/code', data: {
        'contact_info': contactInfo,
        'contact_type': 'phone',
        'device': {
          'device_name': deviceName,
          'fcm_token': 'string',
          'os_version': '1.0.0',
          'device_model': 'iphone',
          'app_version': '0.0.1',
          'is_active': true,
          'notifications_enabled': true
        }
      });
      return Either.right(
          LoginSuccessSchema.fromJson(jsonDecode(response.toString())));
    } on DioException catch (ex) {
      return Either.left(appRepository.statusErrorHandler(ex.response));
    }
  }

  Future<Either<StatusErrorHandlerSchema, VerifySuccessSchema>> verify(
      AppRepository appRepository,
      String contactInfo,
      String deviceName,
      String code) async {
    try {
      var response =
          await appRepository.dio.post('/auth/api/v1/auth/verify-code', data: {
        'contact_info': contactInfo,
        'contact_type': 'phone',
        'device': {
          'device_name': deviceName,
          'fcm_token': 'string',
          'os_version': '1.0.0',
          'device_model': 'iphone',
          'app_version': '0.0.1',
          'is_active': true,
          'notifications_enabled': true
        },
        'code': code
      });

      print('********');
      print(response);
      print('********');
      return Either.right(
          VerifySuccessSchema.fromJson(jsonDecode(response.toString())));
    } on DioException catch (ex) {
      return Either.left(appRepository.statusErrorHandler(ex.response));
    }
  }
}
