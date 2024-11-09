part of 'apit_cubit.dart';

enum ApitStatus { initial, loading, success, error }

class ApitState {
  const ApitState({this.status = ApitStatus.initial, this.message, this.data});

  final ApitStatus status;
  final String? message;
  final LoginSuccessSchema? data;

  ApitState copyWith(
      {ApitStatus? status, String? message, LoginSuccessSchema? data}) {
    return ApitState(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data);
  }
}
