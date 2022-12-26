import 'package:deriv_demo/features/home/data/models/active_sympol_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class BaseDataSource {
  Stream<ActiveSymbolsModel> get getActiveSympols;
  WebSocketSink get addActiveSympolsEvents;
}
