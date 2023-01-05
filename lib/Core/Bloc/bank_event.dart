import 'package:equatable/equatable.dart';

abstract class BankBlocEvent extends Equatable {
  const BankBlocEvent();
}

class FetchAllBanks extends BankBlocEvent {
  const FetchAllBanks();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'All Bank Fetched';
}
