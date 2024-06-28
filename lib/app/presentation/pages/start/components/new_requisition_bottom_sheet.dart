import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/circuits/circuit_entity.dart';
import '../../../components/components.dart';
import '../start_controller.dart';

class NewRequisitionForm extends GetView<StartController> {
  const NewRequisitionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 0.5,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: Obx(
              () => DropdownButton<CircuitEntity>(
                value: controller.selectedCircuit.value,
                hint: const Text("Circuito"),
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                onChanged: (CircuitEntity? newCircuit) => controller.setCircuit(newCircuit),
                items: controller.circuits
                    .map<DropdownMenuItem<CircuitEntity>>((CircuitEntity circuit) {
                  return DropdownMenuItem<CircuitEntity>(
                    value: circuit,
                    child: Text(
                      circuit.contrato,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const Divider(thickness: 0.3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomListTile(
                  title: controller.companyName.value,
                  subTitle: 'Razão social',
                  icon: const FaIcon(
                    FontAwesomeIcons.briefcase,
                    size: 18,
                  ),
                ),
              ),
              Expanded(
                child: CustomListTile(
                  title: controller.companyCNPJ.value,
                  subTitle: 'CNPJ',
                  icon: const FaIcon(FontAwesomeIcons.penNib),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomListTile(
                  title: controller.selectedCircuit.value.banda,
                  subTitle: 'Produto',
                  icon: const FaIcon(
                    FontAwesomeIcons.p,
                    size: 18,
                  ),
                ),
              ),
              Expanded(
                child: CustomListTile(
                  title: controller.selectedCircuit.value.banda,
                  subTitle: 'Banda',
                  icon: const FaIcon(FontAwesomeIcons.gauge),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          CustomListTile(
            title: controller.selectedCircuit.value.plano,
            subTitle: 'Plano',
            icon: const FaIcon(FontAwesomeIcons.p),
          ),
          const SizedBox(height: 8),
          CustomListTile(
            title: controller.authController.account.value.nome,
            subTitle: 'Contato',
            icon: const FaIcon(FontAwesomeIcons.solidUser),
          ),
          const SizedBox(height: 8),
          CustomListTile(
            title: controller.authController.account.value.id,
            subTitle: 'Telefone',
            icon: const FaIcon(FontAwesomeIcons.phone),
          ),
          const SizedBox(height: 8),
          CustomListTile(
            title: controller.authController.account.value.email,
            subTitle: 'E-mail',
            icon: const FaIcon(FontAwesomeIcons.solidEnvelope),
          ),
          const SizedBox(height: 8),
          const Divider(thickness: 0.3),
          Text(
            'Qual o tipo de problema em seu serviço?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Flexible(
                flex: 0,
                child: Row(
                  children: [
                    Obx(
                      () => Radio(
                        value: 'degradação',
                        groupValue: controller.selectedType.value,
                        onChanged: (String? value) => controller.setRequisitionType(value),
                      ),
                    ),
                    const Text('Degradação')
                  ],
                ),
              ),
              Flexible(
                flex: 0,
                child: Row(
                  children: [
                    Obx(
                      () => Radio(
                        value: 'indisponibilidade',
                        groupValue: controller.selectedType.value,
                        onChanged: (String? value) => controller.setRequisitionType(value),
                      ),
                    ),
                    const Text('Indisponibilidade')
                  ],
                ),
              ),
              Flexible(
                flex: 0,
                child: Row(
                  children: [
                    Obx(
                      () => Radio(
                        value: 'serviço',
                        groupValue: controller.selectedType.value,
                        onChanged: (String? value) => controller.setRequisitionType(value),
                      ),
                    ),
                    const Text('Serviço')
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            'Faça uma descrição breve e objetiva do problema:',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8.0),
          TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            controller: controller.problemDescriptionController.value,
            decoration: InputDecoration(
              focusColor: Theme.of(context).scaffoldBackgroundColor,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomButtom(
            label: 'Registrar',
            onTap: () => controller.registerRequisition(context),
          ),
        ],
      ),
    );
  }
}
