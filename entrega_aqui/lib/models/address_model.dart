import 'package:entrega_aqui/core/utils/formatters.dart';

// Retorno da API ViaCEP
class AddressModel {
  const AddressModel({
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.state,
  });

  factory AddressModel.fromViaCep(Map<String, dynamic> json) {
    return AddressModel(
      street: json['logradouro'] as String? ?? '',
      neighborhood: json['bairro'] as String? ?? '',
      city: json['localidade'] as String? ?? '',
      state: json['uf'] as String? ?? '',
    );
  }

  final String street;
  final String neighborhood;
  final String city;
  final String state;

  String get normalizedCity => city.trim().toLowerCase();
  String get normalizedState => state.trim().toUpperCase();

  String get cityState => Formatters.cityState(city, state);
}
