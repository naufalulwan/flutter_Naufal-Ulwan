import 'package:latihan_nvvm/models/user_detail_model.dart';

abstract class UserDetailState {}

class LoadingState extends UserDetailState {}

class SuccessState extends UserDetailState {
  final UserDetailModel userDetail;
  final String successMessage;

  SuccessState(this.userDetail, this.successMessage);
}

class ErrorState extends UserDetailState {
  final Object error;
  final String errorMessage;

  ErrorState(this.error, this.errorMessage);
}
