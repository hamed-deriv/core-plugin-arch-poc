import 'dart:async';
import 'dart:isolate';

import 'package:deriv_adapters_plugins/core/web_socket_connection.dart';
import 'package:domain/domain.dart';

class TickStreamDerivTwoRepository implements TickStreamRepositoryContract {
  @override
  void forgetTickStream() => WebSocketConnection().request(
        <String, dynamic>{
          'forget_all': 'ticks',
        },
      );

  @override
  Stream<TickStreamEntity> fetchTickStream(String symbol) {
    WebSocketConnection().request(<String, dynamic>{'ticks': symbol});

    return WebSocketConnection().response.transform(
      StreamTransformer<dynamic, TickStreamEntity>.fromHandlers(
        handleData: (dynamic event, EventSink<TickStreamEntity> sink) async {
          print(event);
          if (event['msg_type'] == 'tick') {
            if (event['error'] != null) {
              sink.addError(event['error']['message']);

              return;
            }

            if (event['tick']['symbol'] == symbol) {
              final TickStreamEntity model = await Isolate.run(
                () => TickStreamEntity.fromJson(event['tick']),
              );

              sink.add(model);
            }
          }
        },
      ),
    );
  }
}
