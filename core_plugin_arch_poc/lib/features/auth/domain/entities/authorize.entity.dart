import 'package:core_plugin_arch_poc/core/domain/base.domain.dart';

class AuthorizeEntity extends BaseEntity {
  AuthorizeEntity({
    required this.token,
  });

  final String token;

  factory AuthorizeEntity.fromJson(Map<String, dynamic> json) =>
      AuthorizeEntity(
        token: json["token"],
      );
}
