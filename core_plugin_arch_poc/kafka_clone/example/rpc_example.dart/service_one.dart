import 'dart:async';

import 'package:kafka_clone/shelf.dart';

void main() {
  MessageBroker.init();
  MessageBroker().registerTopic('One');
  MessageBroker().registerTopic('Two');

  final ServiceOne serviceOne = ServiceOne();
  final ServiceTwo serviceTwo = ServiceTwo();

  serviceOne.foo();

  serviceTwo.startListening();

  serviceOne.foo();
}

class ServiceOne with ProducerMixin {
  void foo() async {
    print('Service One foo\n');
    final String res = await sendRPCMessage<String>(
      'Two',
      processId: 'bar',
      args: {},
    );
    print(res);
  }
}

class ServiceTwo with ConsumerMixin {
  void startListening() {
    subscribeToTopic('Two', (Message message) async {
      print('Service Two got message $message\n');
      if (message.headers['type'] == 'RPC') {
        switch (message.headers['process_id']) {
          case 'bar':
            final String data = await bar();
            final Completer completer = message.headers['completer'];
            completer.complete(data);
            break;
          default:
        }
      }
    });
  }

  Future<String> bar() async {
    print('Service Two bar\n');
    await Future.delayed(Duration(seconds: 2));
    return 'hello, world';
  }
}
