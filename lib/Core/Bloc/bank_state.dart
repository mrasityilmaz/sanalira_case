import 'package:equatable/equatable.dart';
import 'package:sanalira_case/Core/Utils/api_status.dart';

class BankState extends Equatable {
  const BankState();

  @override
  List<Object> get props => [];
}

class LoadingState extends BankState {}

class SuccessState extends BankState {
  final Success response;

  const SuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class FailureState extends BankState {
  final Failure failure;

  const FailureState(this.failure);

  @override
  List<Object> get props => [failure];
}
