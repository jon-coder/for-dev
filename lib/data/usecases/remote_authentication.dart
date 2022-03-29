import 'package:meta/meta.dart';

import '../../domain/usecases/usecases.dart';

import '../http/http.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });

  Future<void> auth(AutheticationParams params) async {
    httpClient.request(
      url: url,
      method: 'post',
      body: RemoteAutheticationParams.toDomain(params).toJson(),
    );
  }
}

class RemoteAutheticationParams {
  final String email;
  final String password;

  RemoteAutheticationParams({
    @required this.email,
    @required this.password,
  });

  factory RemoteAutheticationParams.toDomain(AutheticationParams entity) => RemoteAutheticationParams(
        email: entity.email,
        password: entity.secret,
      );

  Map toJson() => {
        'email': email,
        'password': password,
      };
}
