import 'package:for_dev/domain/entities/account_entity.dart';
import 'package:meta/meta.dart';

class RemoteAccountModel {
  final String accessToken;

  RemoteAccountModel({
    @required this.accessToken,
  });

  factory RemoteAccountModel.fromJson(Map json) => RemoteAccountModel(
        accessToken: json['accessToken'],
      );

  AccountEntity toEntity() => AccountEntity(accessToken);
}
