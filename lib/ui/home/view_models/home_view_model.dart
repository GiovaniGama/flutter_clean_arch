import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/domain/use_cases/address/get_address_use_case.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required GetAddressUseCase getAddressUseCase})
    : _addressUseCase = getAddressUseCase;

  final GetAddressUseCase _addressUseCase;
}
