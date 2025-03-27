import 'package:flutter_clean_arch/data/repositories/address_repository.dart';
import 'package:flutter_clean_arch/data/services/address_service.dart';
import 'package:flutter_clean_arch/domain/use_cases/address/get_address_use_case.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    Provider(create: (context) => AddressService()),
    Provider(create: (context) => AddressRepository(context.read())),
    Provider(create: (context) => GetAddressUseCase(context.read())),
  ];
}
