import 'dart:convert';

import 'package:flutter_clean_arch/features/cep_list/data/models/address_model.dart';
import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

class AddressDataSource {
  Future<Result<AddressModel>> getAddress(String cep) async {
    final url = Uri.parse('viacep.com.br/ws/$cep/json/');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return Success(AddressModel.fromJson(responseData));
    } else {
      return Failure(Exception(response.body));
    }
  }
}
