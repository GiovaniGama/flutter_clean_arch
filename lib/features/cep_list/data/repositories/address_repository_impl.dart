import 'package:flutter_clean_arch/features/cep_list/data/data_source/address_data_source.dart';
import 'package:flutter_clean_arch/features/cep_list/data/models/address_model.dart';
import 'package:result_dart/result_dart.dart';

class AddressRepositoryImpl {
  final AddressDataSource _addressDataSource;

  AddressRepositoryImpl(this._addressDataSource);

  Future<Result<AddressModel>> getAddress(String cep) async {
    return _addressDataSource.getAddress(cep);
  }
}
