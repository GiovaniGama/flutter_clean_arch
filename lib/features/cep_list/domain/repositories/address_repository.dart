import 'package:flutter_clean_arch/features/cep_list/domain/entities/cep_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract class AddressRepository {
  Future<Result<AddressEntity>> getAddress(String cep);
}
