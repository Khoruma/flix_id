import '../../../data/repositories/authentication.dart';
import '../../../data/repositories/user_repository.dart';
import '../../entities/result.dart';
import 'register_param.dart';
import '../usecase.dart';

import '../../entities/user.dart';

class Register implements UseCase<Result<User>, RegisterParam> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  Register(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParam params) async {
    var uidResult = await _authentication.register(
        email: params.email, password: params.password);

    if (uidResult.isSuccess) {
      var userResult = await _userRepository.createUser(
          uid: uidResult.resultValue!,
          photoUrl: params.photoUrl,
          name: params.name,
          email: params.email);

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return Result.failed(uidResult.errorMessage!);
    }
  }
}
