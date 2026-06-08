import 'package:flutter/material.dart';
import 'dart:async';

// Utilitários
import 'package:entrega_aqui/core/utils/formatters.dart';

// Modelos Base
import 'package:entrega_aqui/models/address_model.dart';

// Regras de Negócio
import 'package:entrega_aqui/services/cep_service.dart';

/// Estados possíveis para uma busca de CEP.
enum CepStatus { idle, loading, success, error }

// Agrupa o estado de um bloco de endereço (origem ou destino).
class AddressFieldState {
  AddressFieldState()
    : cepController = TextEditingController(),
      numberController = TextEditingController();

  final TextEditingController cepController;
  final TextEditingController numberController;

  AddressModel? address;
  CepStatus status = CepStatus.idle;
  String? errorMessage;

  void dispose() {
    cepController.dispose();
    numberController.dispose();
  }
}

/* 
  Gerencia o estado completo da tela de cadastro de encomenda.
  Responsabilidades:
  - Manter estado de origem e destino
  - Coordenar buscas de CEP via [CepService]
  - Calcular frete estimado
  - Validar formulário
*/
class OrderRegisterProvider extends ChangeNotifier {
  OrderRegisterProvider({CepService? cepService})
    : _cepService = cepService ?? CepService();

  final CepService _cepService;

  final AddressFieldState _origin = AddressFieldState();
  final AddressFieldState _destination = AddressFieldState();

  AddressFieldState get origin => _origin;
  AddressFieldState get destination => _destination;

  final TextEditingController weightController = TextEditingController();
  final TextEditingController declaredValueController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Timer? _debounce;

  // --- Atualizar o valor do Peso ---
  void updateWeight({required String value}) {
    notifyListeners();
  }

  // --- Atualizar o valor do Preço ---
  void updateDeclaredValue({required String value}) {
    notifyListeners();
  }

  // --- Atualizar o valor da Descrição ---
  void updateDescription({required String value}) {
    notifyListeners();
  }

  // --- Atualizar o valor do CEP ---
  void updateCep({required String value, required bool isOrigin}) {
    final field = isOrigin ? _origin : _destination;

    final digits = Formatters.parseCep(value);
    final limited = digits.length > 8 ? digits.substring(0, 8) : digits;

    final masked = Formatters.cep(limited);

    if (field.cepController.text == masked) return;

    field.cepController.value = TextEditingValue(
      text: masked,
      selection: TextSelection.collapsed(offset: masked.length),
    );

    // Reset estado ao editar
    field.status = CepStatus.idle;
    field.address = null;

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _tryFetch(isOrigin: isOrigin);
    });
  }

  // --- Atualizar o valor do Número ---
  void updateNumber({required String value, required bool isOrigin}) {
    final field = isOrigin ? _origin : _destination;

    field.numberController.value = TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );

    notifyListeners();
  }

  // --- Validar se o CEP foi preenchido para chamar a API ---
  void _tryFetch({required bool isOrigin}) {
    final field = isOrigin ? _origin : _destination;

    final cep = Formatters.parseCep(field.cepController.text);

    if (cep.length != 8) return;

    if (field.status == CepStatus.loading) return;

    fetchAddress(cep: cep, isOrigin: isOrigin);
  }

  // --- Busca o endereço pelo CEP e atualiza o estado correspondente ---
  Future<void> fetchAddress({
    required String cep,
    required bool isOrigin,
  }) async {
    final field = isOrigin ? _origin : _destination;

    field.status = CepStatus.loading;
    field.address = null;
    field.errorMessage = null;

    notifyListeners();

    try {
      final address = await _cepService.fetchAddress(cep);

      field.address = address;
      field.status = CepStatus.success;
    } catch (e) {
      field.status = CepStatus.error;
      field.errorMessage = e.toString();
    }

    notifyListeners();
  }

  // --- Calcular frete estimado ---
  String get calculateFreight {
    // Valores base para o cálculo
    const double baseValue = 10.0;
    const double perKg = 1.5;

    final double declaredValue = Formatters.parseCurrency(
      declaredValueController.text,
    );
    final double weight = Formatters.parseWeight(weightController.text);

    final AddressModel? origin = _origin.address;
    final AddressModel? destination = _destination.address;

    if (origin == null || destination == null) {
      return 'R\$ 0,00';
    }
    
    final double locationFee = switch (true) {
      _ when origin.normalizedCity == destination.normalizedCity =>
        declaredValue * 0.25, // Mesma Cidade
      _ when origin.normalizedState == destination.normalizedState =>
        20.0 + (declaredValue * 0.10), // Intermunicipal
      _ => 50.0 + (declaredValue * 0.05), // Interestadual
    };

    final double freight = baseValue + (weight * perKg) + locationFee;
    return Formatters.currency(freight);
  }

  bool get isFormValid =>
      _origin.status == CepStatus.success &&
      _destination.status == CepStatus.success &&
      weightController.text.isNotEmpty;

  // --- Salvar a encomenda ---
  void saveEncomenda() {
    debugPrint('--- Salvando encomenda ---');
    debugPrint(
      'Origem: ${_origin.address?.street}, ${_origin.numberController.text}',
    );
    debugPrint(
      'Destino: ${_destination.address?.street}, ${_destination.numberController.text}',
    );
    debugPrint('Peso: ${weightController.text} kg');
    debugPrint('Valor declarado: R\$ ${declaredValueController.text}');
    debugPrint('Descrição: ${descriptionController.text}');
    debugPrint('Frete estimado: $calculateFreight');
  }

  @override
  void dispose() {
    _origin.dispose();
    _destination.dispose();
    weightController.dispose();
    declaredValueController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
