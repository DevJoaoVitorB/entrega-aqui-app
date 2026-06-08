import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Configs
import 'package:entrega_aqui/core/constants/app_colors.dart';
import 'package:entrega_aqui/core/constants/app_values.dart';
import 'package:entrega_aqui/core/utils/decimal_input_formatter.dart';

// Widgets
import 'package:entrega_aqui/widgets/cards/app_section_card.dart';
import 'package:entrega_aqui/widgets/inputs/app_text_field.dart';

// Regras de Negócio
import 'package:entrega_aqui/providers/order_register_provider.dart';

// TODO: Seção para informar os detalhes da encomenda: Peso, Valor Declarado e Descrição.
class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({
    super.key,
    required this.provider,
    required this.weightController,
    required this.declaredValueController,
    required this.descriptionController,
    required this.fieldSpacing,
  });

  final OrderRegisterProvider provider;
  final TextEditingController weightController;
  final TextEditingController declaredValueController;
  final TextEditingController descriptionController;
  final double fieldSpacing;

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'DETALHES DA CARGA',
      icon: Icons.inventory_2_outlined,
      sizeIcon: AppIconSize.lg,
      titleColor: AppColors.darkGreen,
      accentColor: AppColors.lightGreen,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // Campo de Peso da Encomenda
              Expanded(
                child: AppTextField(
                  label: 'Peso (kg)',
                  hintText: '0,000 kg',
                  controller: weightController,
                  onChanged: (value) => {provider.updateWeight(value: value)},
                  inputFormatters: [BrDecimalInputFormatter()],
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: fieldSpacing),

              // Campo de Valor da Encomenda
              Expanded(
                child: AppTextField(
                  label: 'Valor Declarado (R\$)',
                  hintText: 'R\$ 0,00',
                  controller: declaredValueController,
                  onChanged: (value) => {
                    provider.updateDeclaredValue(value: value),
                  },
                  inputFormatters: [BrDecimalInputFormatter()],
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Campo de Descrição de Encomenda
          AppTextField(
            label: 'Descrição',
            hintText: 'Descreva o conteúdo da encomenda',
            controller: descriptionController,
            onChanged: (value) => {provider.updateDescription(value: value)},
          ),
        ],
      ),
    );
  }
}
