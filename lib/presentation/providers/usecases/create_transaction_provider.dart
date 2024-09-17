import '../../../domain/usecase/create_transaction/create_transaction.dart';
import '../repositories/transaction_repository/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_transaction_provider.g.dart';

@riverpod
CreateTransaction createTransaction(CreateTransactionRef ref) =>
    CreateTransaction(
        transactionRepository: ref.watch(transactionRepositoryProvider));
