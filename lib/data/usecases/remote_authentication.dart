import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

import '../http/http.dart';
import '../models/models.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });

  Future<AccountEntity> auth(AutheticationParams params) async {
    final body = RemoteAutheticationParams.toDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: url, method: 'post', body: body);
      return RemoteAccountModel.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized ? DomainError.invalidCredentials : DomainError.unexpected;
    }
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
