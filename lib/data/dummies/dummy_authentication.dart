import '../../domain/entities/result.dart';
import '../repositories/authentication.dart';

class DummyAuthentication implements Authentication {
  @override
  String? getLoggedUserId() {
    // TODO: implement getLoggedUserId
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));

    // return const Result.success('ID-12345');
    return const Result.failed('Login gagal');
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> register(
      {required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
