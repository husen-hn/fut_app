import 'package:dio/dio.dart';
import 'package:fut_app/apps/apit/apit.dart';
import 'package:fut_app/apps/apit/apit_repository.dart';
import 'package:fut_app/apps/helper/status_error_handler_schema.dart';

abstract class IAppRepository {
  Dio get dio;
  StatusErrorHandlerSchema statusErrorHandler(Response? response);
}

class AppRepository implements IAppRepository {
  AppRepository();

  final ApitRepository apitRepository = ApitRepository(apit: Apit());

  @override
  Dio get dio => Dio(BaseOptions(
      baseUrl: 'https://api.persia.tickets',
      receiveDataWhenStatusError: true,
      // headers: {
      //   'accept': 'application/json',
      //   'Content-Type': 'application/json'
      // },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30)));

  @override
  StatusErrorHandlerSchema statusErrorHandler(Response? response) {
    switch (response?.statusCode) {
      case 500:
        return StatusErrorHandlerSchema(
            message: "Server Error pls retry later");
      case 502:
        return StatusErrorHandlerSchema(message: "Bad Gateway");
      case 400:
        return StatusErrorHandlerSchema(message: 'Bad Request!');
      case 401:
        return StatusErrorHandlerSchema(message: 'Unauthorized!');
      case 403:
        return StatusErrorHandlerSchema(
            message: 'Error occurred pls check internet and retry.');
      case 404:
        return StatusErrorHandlerSchema(message: 'Not Found!');
      default:
        return StatusErrorHandlerSchema(message: 'Error occurred!');
    }
  }
}
