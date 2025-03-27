import 'package:flutter_clean_arch/data/repositories/address_repository.dart';
import 'package:flutter_clean_arch/domain/entities/address_entity.dart';
import 'package:flutter_clean_arch/utils/result.dart';

class GetAddressUseCase {
  final AddressRepository _addressRepository;

  GetAddressUseCase(this._addressRepository);

  Future<Result<AddressEntity>> execute(String cep) async {
    final result = await _addressRepository.getAddress(cep);

    switch (result) {
      case Error<AddressEntity>():
        return Result.error(result.error);
      case Success<AddressEntity>():
        return Result.success(result.value);
    }
  }
}
