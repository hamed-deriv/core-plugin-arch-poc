import 'package:core_plugin_arch_poc/core/domain/base.domain.dart';

base class ActiveSymbolEntity extends BaseEntity {
  ActiveSymbolEntity({
    required this.symbol,
    required this.symbolDisplayName,
    required this.market,
    required this.marketDisplayName,
  });

  final String symbol;
  final String symbolDisplayName;
  final String market;
  final String marketDisplayName;

  ActiveSymbolEntity.fromJson(Map<String, dynamic> json)
      : symbol = json['symbol'],
        symbolDisplayName = json['display_name'],
        market = json['market'],
        marketDisplayName = json['market_display_name'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'symbol': symbol,
        'display_name': symbolDisplayName,
        'market': market,
        'market_display_name': marketDisplayName,
      };
}
