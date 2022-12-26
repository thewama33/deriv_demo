import 'package:deriv_demo/features/home/data/datasources/base/base_data_source.dart';
import 'package:deriv_demo/features/home/data/datasources/sockets_data_sourcee.dart';
import 'package:deriv_demo/features/home/data/repositories/sockets_repository_impl.dart';
import 'package:deriv_demo/features/home/domain/repositories/base_sockets_repository.dart';
import 'package:deriv_demo/features/home/domain/usecases/Get_Active_Sympols.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

class ServiceLocator {
  static init() {
    getit.registerLazySingleton(() => GetActiveSympols(socketsRepository: getit()));
    getit.registerLazySingleton<BaseSocketsRepository>(
        () => SocketsRepositoryImpl(baseDataSource: getit()));
    getit.registerLazySingleton<BaseDataSource>(() => SocketsDataSource());
  }
}
