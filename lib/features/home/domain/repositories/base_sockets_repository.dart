import 'package:web_socket_channel/web_socket_channel.dart';

import '../../data/models/active_sympol_model.dart';

abstract class BaseSocketsRepository {
  Stream<ActiveSymbolsModel> get getActiveSympols;
  WebSocketSink get addActiveSympolsEvents;
}
