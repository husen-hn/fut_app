import 'package:fpdart/fpdart.dart';
import 'package:fut_app/apps/apit/apit.dart';
import 'package:fut_app/apps/app/app_repository.dart';
import 'package:fut_app/apps/helper/status_error_handler_schema.dart';
import 'package:fut_app/apps/helper/login_success_schema.dart';
import 'package:fut_app/apps/helper/verify_success_schema.dart';

abstract class IApitRepository {
  Future<Either<StatusErrorHandlerSchema, LoginSuccessSchema>> login(
      AppRepository appRepository, String contactInfo, String deviceName);

  Future<Either<StatusErrorHandlerSchema, VerifySuccessSchema>> verify(
      AppRepository appRepository,
      String contactInfo,
      String deviceName,
      String code);
}

class ApitRepository implements IApitRepository {
  ApitRepository({required Apit apit}) : _apit = apit;

  final Apit _apit;

  @override
  Future<Either<StatusErrorHandlerSchema, LoginSuccessSchema>> login(
          AppRepository appRepository, contactInfo, deviceName) =>
      _apit.login(appRepository, contactInfo, deviceName);

  @override
  Future<Either<StatusErrorHandlerSchema, VerifySuccessSchema>> verify(
          AppRepository appRepository,
          String contactInfo,
          String deviceName,
          String code) =>
      _apit.verify(appRepository, contactInfo, deviceName, code);
}
