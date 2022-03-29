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
    final body = {'email': params.email, 'password': params.secret};
    httpClient.request(url: url, method: 'post', body: body);
  }
}
