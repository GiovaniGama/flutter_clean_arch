import 'package:flutter_clean_arch/data/model/address_model.dart';
import 'package:flutter_clean_arch/data/services/address_service.dart';
import 'package:flutter_clean_arch/domain/entities/address_entity.dart';
import 'package:flutter_clean_arch/utils/result.dart';

class AddressRepository {
  final AddressService _addressService;

  AddressRepository(this._addressService);

  Future<Result<AddressEntity>> getAddress(String cep) async {
    final result = await _addressService.getAddress(cep);

    switch (result) {
      case Error<AddressModel>():
        return Result.error(result.error);
      case Success<AddressModel>():
        return Result.success(
          AddressEntity(
            cep: result.value.cep,
            logradouro: result.value.logradouro,
            complemento: result.value.complemento,
            bairro: result.value.bairro,
            estado: result.value.estado,
            uf: result.value.uf,
          ),
        );
    }
  }
}
