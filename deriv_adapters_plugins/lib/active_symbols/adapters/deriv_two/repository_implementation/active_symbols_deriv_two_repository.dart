import 'dart:async';
import 'dart:isolate';

import 'package:deriv_adapters_plugins/core/web_socket_connection.dart';
import 'package:domain/domain.dart';

class ActiveSymbolsDerivTwoRepository
    implements ActiveSymbolsRepositoryContract {
  @override
  Future<List<ActiveSymbolEntity>> fetchActiveSymbols(
      Map<String, dynamic>? args) async {
    WebSocketConnection().request(
      <String, dynamic>{
        'active_symbols': 'brief',
        'product_type': 'basic',
      },
    );

    return WebSocketConnection().response.transform(
      StreamTransformer<dynamic, List<ActiveSymbolEntity>>.fromHandlers(
        handleData: (
          dynamic event,
          EventSink<List<ActiveSymbolEntity>> sink,
        ) async {
          if (event['msg_type'] == 'active_symbols') {
            if (event['error'] != null) {
              sink.addError(event['error']['message']);

              return;
            }

            final List<ActiveSymbolEntity> models =
                await Isolate.run<List<ActiveSymbolEntity>>(
              () => event['active_symbols']
                  .map<ActiveSymbolEntity>(
                    (dynamic item) => ActiveSymbolEntity.fromJson(item),
                  )
                  .toList(),
            );

            sink.add(models);
          }
        },
      ),
    ).first;
  }
}
