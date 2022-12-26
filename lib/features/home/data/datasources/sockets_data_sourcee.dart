import 'dart:convert';
import 'package:deriv_demo/features/home/data/datasources/base/base_data_source.dart';
import 'package:deriv_demo/features/home/data/models/active_sympol_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketsDataSource extends BaseDataSource {
  static const String _appId = '31063';
  static const String baseUrl =
      'wss://green.binaryws.com/websockets/v3?app_id=$_appId';
  late final IOWebSocketChannel _channel =
      IOWebSocketChannel.connect(Uri.parse(baseUrl));

      

  @override
  Stream<ActiveSymbolsModel> get getActiveSympols =>
      _channel.stream.map<ActiveSymbolsModel>(
          (event) => ActiveSymbolsModel.fromJson(jsonDecode(event)));

  @override
  WebSocketSink get addActiveSympolsEvents => _channel.sink;
}
