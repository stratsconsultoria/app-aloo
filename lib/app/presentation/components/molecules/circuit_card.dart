import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/entities/entities.dart';
import '../components.dart';

class CircuitCard extends StatelessWidget {
  final CircuitEntity circuit;

  const CircuitCard({
    super.key,
    required this.circuit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      circuit.contrato,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Circuito',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                const FaIcon(
                  FontAwesomeIcons.circleInfo,
                  size: 32,
                ),
              ],
            ),
            const Divider(thickness: 0.3),
            CustomListTile(
              title: circuit.plano,
              subTitle: 'Plano',
              icon: const FaIcon(FontAwesomeIcons.p),
            ),
            const SizedBox(height: 8),
            CustomListTile(
              title: circuit.banda,
              subTitle: 'Banda',
              icon: const FaIcon(
                FontAwesomeIcons.gauge,
                size: 18,
              ),
            ),
            const SizedBox(height: 8),
            CustomListTile(
              title:
                  "${circuit.logradouro}, ${circuit.numero} - ${circuit.bairro} ${circuit.complemento ?? '- ${circuit.complemento}'}",
              subTitle: 'Endereço',
              icon: const FaIcon(FontAwesomeIcons.locationDot),
            ),
            const SizedBox(height: 8),
            CustomListTile(
              title: "${circuit.cidade} / ${circuit.estado}",
              subTitle: 'Cidade / UF',
              icon: const FaIcon(
                FontAwesomeIcons.city,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
