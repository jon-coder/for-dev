import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class Authentication {
  Future<AccountEntity> auth(AutheticationParams params);
}

class AutheticationParams {
  final String email;
  final String secret;

  AutheticationParams({
    @required this.email,
    @required this.secret,
  });
}
