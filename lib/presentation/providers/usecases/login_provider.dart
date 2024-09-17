import '../../../domain/usecase/login/login.dart';
import '../repositories/authentication/authentication_provider.dart';
import '../repositories/user_repository/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) => Login(
    authentication: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
