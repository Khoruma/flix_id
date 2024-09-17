import '../../../../data/firebase/firebase_authentication.dart';
import '../../../../data/repositories/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
Authentication authentication(AuthenticationRef ref) =>
    FirebaseAuthentication();
