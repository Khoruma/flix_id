import '../../../data/repositories/transaction_repository.dart';
import '../../entities/result.dart';
import '../../entities/transaction.dart';
import 'get_transaction_param.dart';
import '../usecase.dart';

class GetTransaction
    implements UseCase<Result<List<Transaction>>, GetTransactionParam> {
  final TransactionRepository _transactionRepository;

  GetTransaction({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionParam params) async {
    var resultListTransaction =
        await _transactionRepository.getUserTransactions(uid: params.uid);

    return switch (resultListTransaction) {
      Success(value: final transactionsList) =>
        Result.success(transactionsList),
      Failed(:final message) => Result.failed(message),
    };
  }
}
