// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:deriv_demo/features/home/data/models/active_sympol_model.dart';
import 'package:deriv_demo/features/home/domain/repositories/base_sockets_repository.dart';

class GetActiveSympols {
  final BaseSocketsRepository socketsRepository;
  GetActiveSympols({
    required this.socketsRepository,
  });

  Stream<ActiveSymbolsModel> execute() {
    return socketsRepository.getActiveSympols;
  }

  addEvent(String data) {
    return socketsRepository.addActiveSympolsEvents.add(data);
  }
}
