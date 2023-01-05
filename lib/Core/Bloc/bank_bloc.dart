import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanalira_case/Core/Bloc/bank_state.dart';
import 'package:sanalira_case/Core/Repository/repository.dart';
import 'package:sanalira_case/Core/Utils/api_status.dart';

import 'bank_event.dart';

class BankBloc extends Bloc<BankBlocEvent, BankState> {
  final Repository serviceRepository;

  BankBloc({
    required this.serviceRepository,
  })  
  // ignore: unnecessary_null_comparison
  : assert(serviceRepository != null),
        super(LoadingState()) {
    on<BankBlocEvent>((event, emit) async {
      if (event is FetchAllBanks) {
        await _fetchAllBanks(
          emit,
        );
      }
    });
  }

  Future _fetchAllBanks(
    Emitter<BankState> emit,
  ) async {
    emit(LoadingState());
    try {
      final response = await serviceRepository.fetchAllBanks();
      if (response is Success) {
        emit(SuccessState(response));
      } else if (response is Failure) {
        emit(FailureState(response));
      }
    } catch (_) {
      emit(FailureState(Failure(errorMessage: _)));
    }
  }
}
