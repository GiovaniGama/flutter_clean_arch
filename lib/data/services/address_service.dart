import 'dart:convert';

import 'package:flutter_clean_arch/data/model/address_model.dart';
import 'package:flutter_clean_arch/utils/result.dart';
import 'package:http/http.dart' as http;

class AddressService {
  Future<Result<AddressModel>> getAddress(String cep) async {
    final url = Uri.parse('viacep.com.br/ws/$cep/json/');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return Result.success(AddressModel.fromJson(responseData));
    } else {
      return Result.error(Exception(response.body));
    }
  }
}
