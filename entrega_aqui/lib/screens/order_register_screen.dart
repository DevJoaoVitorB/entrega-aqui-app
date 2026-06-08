import 'package:entrega_aqui/core/constants/app_values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Configs
import 'package:entrega_aqui/core/constants/app_colors.dart';

// Widgets
import 'package:entrega_aqui/widgets/buttons/app_primary_button.dart';
import 'package:entrega_aqui/widgets/layout/app_top_bar.dart';
import 'package:entrega_aqui/widgets/sections/address_form_section.dart';
import 'package:entrega_aqui/widgets/sections/freight_summary_section.dart';
import 'package:entrega_aqui/widgets/sections/order_details_section.dart';
import 'package:entrega_aqui/widgets/layout/app_bottom_navigation_bar.dart';

// Regras de Negócio
import 'package:entrega_aqui/providers/order_register_provider.dart';

// Tela de cadastro de encomenda
class OrderRegisterScreen extends StatelessWidget {
  const OrderRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderRegisterProvider>(
      create: (_) => OrderRegisterProvider(),
      child: const _OrderRegisterView(),
    );
  }
}

class _OrderRegisterView extends StatelessWidget {
  const _OrderRegisterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool isWide = constraints.maxWidth >= 420;
            final double fieldSpacing = isWide ? AppSpacing.lg : AppSpacing.md;
            final double numberFieldWidth = isWide ? 96 : 84;

            return Column(
              children: <Widget>[
                const AppTopBar(title: 'Nova Encomenda'),
                Expanded(
                  child: Consumer<OrderRegisterProvider>(
                    builder:
                        (
                          BuildContext context,
                          OrderRegisterProvider provider,
                          Widget? _,
                        ) {
                          return ListView(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.lg,
                            ),
                            children: <Widget>[
                              // Formulário para localização de origem da encomenda
                              AddressFormSection(
                                title: 'ORIGEM',
                                icon: Icons.location_on_outlined,
                                provider: provider,
                                isOrigin: true,
                                fieldSpacing: fieldSpacing,
                                numberFieldWidth: numberFieldWidth,
                                pendingHint:
                                    'Digite o CEP para buscar o endereço',
                              ),
                              const SizedBox(height: 12),

                              // Formulário para localização de destino da encomenda
                              AddressFormSection(
                                title: 'DESTINO',
                                icon: Icons.flag_outlined,
                                provider: provider,
                                isOrigin: false,
                                fieldSpacing: fieldSpacing,
                                numberFieldWidth: numberFieldWidth,
                                pendingHint:
                                    'Digite o CEP para buscar o endereço',
                              ),
                              const SizedBox(height: 12),

                              // Formulário dos dados da encomenda
                              OrderDetailsSection(
                                provider: provider,
                                weightController: provider.weightController,
                                declaredValueController:
                                    provider.declaredValueController,
                                descriptionController:
                                    provider.descriptionController,
                                fieldSpacing: fieldSpacing,
                              ),
                              const SizedBox(height: 12),

                              // Exibição do frete calculado para a encomenda
                              FreightSummarySection(
                                calculateFreight: provider.calculateFreight,
                              ),
                              const SizedBox(height: 18),

                              AppPrimaryButton(
                                label: 'SALVAR ENCOMENDA',
                                icon: Icons.save_outlined,
                                onPressed: () => AlertDialog(
                                  content: Text('Encomenda Salva'),
                                ),
                              ),
                            ],
                          );
                        },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(selectedIndex: 1),
    );
  }
}
