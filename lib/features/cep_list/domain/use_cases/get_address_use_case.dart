import 'package:flutter_clean_arch/features/cep_list/domain/entities/cep_entity.dart';
import 'package:flutter_clean_arch/features/cep_list/domain/repositories/address_repository.dart';
import 'package:result_dart/result_dart.dart';

class GetAddressUseCase {
  final AddressRepository addressRepository;

  GetAddressUseCase(this.addressRepository);

  Future<Result<AddressEntity>> execute(String cep) async {
    return await addressRepository.getAddress(cep);
  }
}
