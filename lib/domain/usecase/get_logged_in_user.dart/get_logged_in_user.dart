import '../../../data/repositories/authentication.dart';
import '../../../data/repositories/user_repository.dart';
import '../../entities/result.dart';
import '../usecase.dart';

import '../../entities/user.dart';

class GetLoggedInUser implements UseCase<Result<User>, void> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  GetLoggedInUser(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(void params) async {
    String? loggedId = _authentication.getLoggedUserId();

    if (loggedId != null) {
      var userResult = await _userRepository.getUser(uid: loggedId);

      if (userResult is Success) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return const Result.failed('No user logged in');
    }
  }
}
