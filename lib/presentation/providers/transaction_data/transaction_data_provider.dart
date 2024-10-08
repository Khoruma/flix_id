import '../../../domain/entities/result.dart';
import '../../../domain/entities/transaction.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecase/get_transaction/get_transaction.dart';
import '../../../domain/usecase/get_transaction/get_transaction_param.dart';
import '../usecases/get_transaction_provider.dart';
import '../user_data/user_data_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_data_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionData extends _$TransactionData {
  @override
  Future<List<Transaction>> build() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();

      GetTransaction getTransaction = ref.read(getTransactionProvider);

      var result = await getTransaction(GetTransactionParam(uid: user.uid));

      if (result case Success(value: final transactions)) {
        return transactions;
      }
    }

    return [];
  }

  Future<void> refreshTransactionData() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();

      GetTransaction getTransaction = ref.read(getTransactionProvider);

      var result = await getTransaction(GetTransactionParam(uid: user.uid));

      switch (result) {
        case Success(value: final transactions):
          state = AsyncData(transactions);
        case Failed(:final message):
          state = AsyncError(FlutterError(message), StackTrace.current);
          state = AsyncData(state.valueOrNull ?? []);
      }
    }
  }
}
