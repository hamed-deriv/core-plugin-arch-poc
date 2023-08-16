import 'package:core_plugin_arch_poc/core/data/base.data.dart';

class AuthorizeModel extends BaseDataModel {
  AuthorizeModel({
    required this.token,
  });

  final String token;

  factory AuthorizeModel.fromJson(Map<String, dynamic> json) => AuthorizeModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
