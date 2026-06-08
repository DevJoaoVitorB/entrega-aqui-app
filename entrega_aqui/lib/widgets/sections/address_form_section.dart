import 'package:flutter/material.dart';

// Configs
import 'package:entrega_aqui/core/constants/app_colors.dart';
import 'package:entrega_aqui/core/constants/app_values.dart';

// Utilitários
import 'package:entrega_aqui/core/utils/formatters.dart';

// Modelos Base
import 'package:entrega_aqui/models/address_model.dart';

// Providers
import 'package:entrega_aqui/providers/order_register_provider.dart';

// Widgets
import 'package:entrega_aqui/widgets/cards/app_section_card.dart';
import 'package:entrega_aqui/widgets/inputs/app_text_field.dart';

// TODO: Seção de origem ou destino da encomenda
class AddressFormSection extends StatelessWidget {
  const AddressFormSection({
    super.key,
    required this.title,
    required this.icon,
    required this.provider,
    required this.isOrigin,
    required this.fieldSpacing,
    required this.numberFieldWidth,
    required this.pendingHint,
  });

  final String title;
  final IconData icon;

  final OrderRegisterProvider provider;
  final bool isOrigin;

  final double fieldSpacing;
  final double numberFieldWidth;

  // Texto exibido no placeholder enquanto o endereço não foi buscado.
  final String pendingHint;

  @override
  Widget build(BuildContext context) {
    final state = isOrigin ? provider.origin : provider.destination;

    return AppSectionCard(
      title: title,
      icon: icon,
      sizeIcon: AppIconSize.lg,
      accentColor: AppColors.lightBlue,
      titleColor: AppColors.darkBlue,
      child: Column(
        children: <Widget>[
          _CepNumberRow(
            provider: provider,
            isOrigin: isOrigin,
            fieldSpacing: fieldSpacing,
            numberFieldWidth: numberFieldWidth,
          ),
          const SizedBox(height: 12),
          _AddressResultBox(state: state, pendingHint: pendingHint),
        ],
      ),
    );
  }
}

// Linha com campo CEP (expansível) e campo Número (largura fixa).
class _CepNumberRow extends StatelessWidget {
  const _CepNumberRow({
    required this.provider,
    required this.isOrigin,
    required this.fieldSpacing,
    required this.numberFieldWidth,
  });

  final OrderRegisterProvider provider;
  final bool isOrigin;
  final double fieldSpacing;
  final double numberFieldWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: AppTextField(
            label: 'CEP',
            hintText: 'CEP',
            controller: isOrigin
                ? provider.origin.cepController
                : provider.destination.cepController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              provider.updateCep(value: value, isOrigin: isOrigin);
            },
          ),
        ),
        SizedBox(width: fieldSpacing),
        SizedBox(
          width: numberFieldWidth,
          child: AppTextField(
            label: 'Número',
            hintText: 'Número',
            controller: isOrigin
                ? provider.origin.numberController
                : provider.destination.numberController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              provider.updateNumber(value: value, isOrigin: isOrigin);
            },
          ),
        ),
      ],
    );
  }
}

// Caixa de resultado que alterna entre: placeholder, loading, erro e endereço.
class _AddressResultBox extends StatelessWidget {
  const _AddressResultBox({required this.state, required this.pendingHint});

  final AddressFieldState state;
  final String pendingHint;

  @override
  Widget build(BuildContext context) {
    return switch (state.status) {
      CepStatus.idle => _PendingBox(hint: pendingHint),
      CepStatus.loading => const _LoadingBox(),
      CepStatus.error => _ErrorBox(
        message: state.errorMessage ?? 'Erro ao buscar CEP.',
      ),
      CepStatus.success => _SuccessBox(
        address: state.address!,
        number: state.numberController.text,
      ),
    };
  }
}

// Placeholder antes de qualquer busca (mesmo visual do destino original).
class _PendingBox extends StatelessWidget {
  const _PendingBox({required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        hint,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// Indicador de carregamento durante a busca do CEP.
class _LoadingBox extends StatelessWidget {
  const _LoadingBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.foreground,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}

// Exibe mensagem de erro quando o CEP não é encontrado ou há falha de rede.
class _ErrorBox extends StatelessWidget {
  const _ErrorBox({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.foreground,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.lightRed),
      ),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.error_outline,
            color: AppColors.lightRed,
            size: AppIconSize.lg,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.lightRed,
                fontSize: AppFontSize.sm,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Exibe os dados do endereço retornado com sucesso pelo ViaCEP.
class _SuccessBox extends StatelessWidget {
  const _SuccessBox({required this.address, required this.number});

  final AddressModel address;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.foreground,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _AddressField(
            label: 'Endereço',
            value: Formatters.streetAddress(address.street, number),
          ),
          const SizedBox(height: 12),
          _AddressField(label: 'Bairro', value: address.neighborhood),
          const SizedBox(height: 12),
          _AddressField(label: 'Cidade/UF', value: address.cityState),
        ],
      ),
    );
  }
}

/// Par label + valor dentro do bloco de endereço.
class _AddressField extends StatelessWidget {
  const _AddressField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.normal,
            fontSize: AppFontSize.sm,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value.isEmpty ? '—' : value,
          style: const TextStyle(
            fontSize: AppFontSize.lg,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
