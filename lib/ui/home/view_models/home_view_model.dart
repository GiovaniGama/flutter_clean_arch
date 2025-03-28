import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/domain/entities/address_entity.dart';
import 'package:flutter_clean_arch/domain/use_cases/address/get_address_use_case.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required GetAddressUseCase getAddressUseCase})
    : _addressUseCase = getAddressUseCase;

  final GetAddressUseCase _addressUseCase;

  AddressEntity? _address;
  bool _isError = false;
  bool _isLoading = false;

  AddressEntity? get address => _address;
  bool get isError => _isError;
  bool get isLoading => _isLoading;

  Future<void> getAddress(String cep) async {
    _isLoading = true;
    notifyListeners();

    final removeFormatCep = cep.split('-').join('');
    final result = await _addressUseCase.execute(removeFormatCep);

    if (result.isSuccess) {
      _address = result.value;
      _isLoading = false;
      notifyListeners();
    } else {
      _isError = true;
      _isLoading = false;
      notifyListeners();
    }
  }
}
