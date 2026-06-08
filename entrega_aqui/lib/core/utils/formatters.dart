import 'package:intl/intl.dart';

class Formatters {
  // Máscara para Números (pt-BR)
  static String numberBR(double value) {
    final NumberFormat formatter = NumberFormat('#,##0.00', 'pt_BR');
    return formatter.format(value);
  }

  // Máscara de Moeda (R$ 1.234,56)
  static String currency(double value) {
    final NumberFormat formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
    );
    return formatter.format(value);
  }

  // Formatação de Data: 12 Jun, 2026
  static String date(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMM, yyyy', 'pt_BR');
    return formatter.format(date);
  }

  // Máscara de CEP: 12345-678
  static String cep(String value) {
    final String digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 8) return value;
    return '${digits.substring(0, 5)}-${digits.substring(5)}';
  }

  // Máscara de Peso: 12,500 kg
  static String weight(double value) {
    final NumberFormat formatter = NumberFormat('#,##0.000', 'pt_BR');
    return '${formatter.format(value)} kg';
  }

  // Formatação de Endereço: Rua Albuquerque, 1472
  static String streetAddress(String street, String number) {
    if (street.isEmpty) return '—';
    if (number.isEmpty) return street;
    return '$street, $number';
  }

  // Formatação de Localidade: Natal / RN
  static String cityState(String city, String state) {
    if (city.isEmpty && state.isEmpty) return '';
    if (state.isEmpty) return city;
    if (city.isEmpty) return state;

    final String uf = state.length > 2
        ? state.substring(0, 2).toUpperCase()
        : state.toUpperCase();

    return '$city / $uf';
  }

  // Remove máscara do CEP e retorna apenas os 8 dígitos: "12345-678" → "12345678"
  static String parseCep(String value) {
    return value.replaceAll(RegExp(r'\D'), '');
  }

  // Remove máscara de peso e retorna um double:
  static double parseWeight(String value) {
    final String clean = value.replaceAll(RegExp(r'[^\d,.]'), '').trim();
    if (clean.isEmpty) return 0.0;
    try {
      return NumberFormat('#,##0.000', 'pt_BR').parse(clean).toDouble();
    } on FormatException {
      return 0.0;
    }
  }

  // Remove máscara de moeda e retorna um double
  static double parseCurrency(String value) {
    final String clean = value.replaceAll(RegExp(r'[^\d,.]'), '').trim();
    if (clean.isEmpty) return 0.0;
    try {
      return NumberFormat.currency(
        locale: 'pt_BR',
        symbol: '',
      ).parse(clean).toDouble();
    } on FormatException {
      return 0.0;
    }
  }
}
