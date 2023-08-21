import 'package:kafka_clone/shelf.dart';

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
