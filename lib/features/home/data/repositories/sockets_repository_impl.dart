// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:deriv_demo/features/home/data/datasources/base/base_data_source.dart';
import 'package:deriv_demo/features/home/data/models/active_sympol_model.dart';
import 'package:deriv_demo/features/home/domain/repositories/base_sockets_repository.dart';
import 'package:web_socket_channel/src/channel.dart';

class SocketsRepositoryImpl implements BaseSocketsRepository {
  BaseDataSource baseDataSource;
  SocketsRepositoryImpl({
    required this.baseDataSource,
  });
  @override
  Stream<ActiveSymbolsModel> get getActiveSympols =>
      baseDataSource.getActiveSympols;

  @override
  WebSocketSink get addActiveSympolsEvents =>
      baseDataSource.addActiveSympolsEvents;
}
