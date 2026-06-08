import 'dart:convert';
import 'package:entrega_aqui/models/address_model.dart';
import 'package:http/http.dart' as http;

// Responsável pela integração com a API ViaCEP.
class CepService {
  static const String _baseUrl = 'https://viacep.com.br/ws';

  Future<AddressModel> fetchAddress(String cep) async {
    final String digits = cep.replaceAll(RegExp(r'\D'), '');

    final http.Response response = await http
        .get(Uri.parse('$_baseUrl/$digits/json/'))
        .timeout(
          const Duration(seconds: 10),
          onTimeout: () => throw Exception('Tempo esgotado. Tente novamente.'),
        );

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar CEP. Tente novamente.');
    }

    final Map<String, dynamic> json =
        jsonDecode(response.body) as Map<String, dynamic>;

    if (json['erro'] == true) {
      throw Exception('CEP não encontrado.');
    }

    return AddressModel.fromViaCep(json);
  }
}
