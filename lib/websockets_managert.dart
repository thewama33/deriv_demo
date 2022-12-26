import 'package:web_socket_channel/io.dart';

class WebSocketHelper {
  static const String _appId = '31063';
  static const String baseUrl =
      'wss://green.binaryws.com/websockets/v3?app_id=$_appId';

  static late IOWebSocketChannel _channel;
  static late WebSocketHelper _instance;

  WebSocketHelper._() {
    _channel = IOWebSocketChannel.connect(baseUrl);
  }

  static WebSocketHelper get getInstance =>
      _instance = _instance ?? WebSocketHelper._();

  Function(String) get sendWebSocketRequest => _channel.sink.add;
  Stream<dynamic> get webSocketResponse => _channel.stream;

  dispose() {
    _channel.sink.close();
  }
}
