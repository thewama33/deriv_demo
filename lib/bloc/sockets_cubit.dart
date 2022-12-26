import 'package:flutter_bloc/flutter_bloc.dart';

import '../websockets_managert.dart';
part 'sockets_state.dart';

class SocketsCubit extends Cubit<SocketsState> {
  SocketsCubit() : super(SocketsInitial());
  Stream connectServer(data) async* {
    yield WebSocketHelper.getInstance.sendWebSocketRequest(data);
  }
}
