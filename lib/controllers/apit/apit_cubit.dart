import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fut_app/apps/apit/apit_repository.dart';
import 'package:fut_app/apps/app/app_repository.dart';
import 'package:fut_app/apps/helper/login_success_schema.dart';
import 'package:fut_app/apps/helper/status_error_handler_schema.dart';
import 'package:fut_app/apps/helper/verify_success_schema.dart';

part 'apit_state.dart';

class ApitCubit extends Cubit<ApitState> {
  ApitCubit({
    required AppRepository appRepository,
  })  : _appRepository = appRepository,
        _apitRepository = appRepository.apitRepository,
        super(const ApitState());

  final AppRepository _appRepository;
  final ApitRepository _apitRepository;

  final loginFormKey = GlobalKey<FormState>();
  final verifyFormKey = GlobalKey<FormState>();
  final contactInfoController = TextEditingController();
  final deviceNameController = TextEditingController();
  final verifyCodeController = TextEditingController();

  login(String contactInfo, String deviceName) async {
    emit(state.copyWith(status: ApitStatus.loading));

    Either<StatusErrorHandlerSchema, LoginSuccessSchema> res =
        await _apitRepository.login(_appRepository, contactInfo, deviceName);

    res.match(
        (left) => emit(
            state.copyWith(status: ApitStatus.error, message: left.message)),
        (right) =>
            emit(state.copyWith(status: ApitStatus.success, data: right)));
  }

  verify(String contactInfo, String deviceName, String code) async {
    emit(state.copyWith(status: ApitStatus.loading));

    Either<StatusErrorHandlerSchema, VerifySuccessSchema> res =
        await _apitRepository.verify(
            _appRepository, contactInfo, deviceName, code);

    res.match(
        (left) => emit(
            state.copyWith(status: ApitStatus.error, message: left.message)),
        (right) => emit(state.copyWith(status: ApitStatus.success)));
  }
}
