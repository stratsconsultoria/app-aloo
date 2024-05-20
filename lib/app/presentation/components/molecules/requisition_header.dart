import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../domain/entities/requisitions/requisitions.dart';
import '../components.dart';

class RequisitionHeader extends StatelessWidget {
  final RequisitionEntity requisition;

  const RequisitionHeader({
    required this.requisition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          CustomListTile(
            title: requisition.solicitante,
            subTitle: 'Reclamante',
            icon: const FaIcon(FontAwesomeIcons.solidUser),
          ),
          const SizedBox(height: 8),
          CustomListTile(
            title: requisition.abertura,
            subTitle: 'Abertura',
            icon: const FaIcon(FontAwesomeIcons.calendarDays),
          ),
          const SizedBox(height: 8),
          CustomListTile(
            title: requisition.postoAtual.toUpperCase(),
            subTitle: 'Posto',
            icon: const FaIcon(FontAwesomeIcons.layerGroup, size: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomListTile(
                  title: requisition.solicitante,
                  subTitle: 'Impacto Informado',
                  icon: const FaIcon(
                    FontAwesomeIcons.personCircleExclamation,
                    size: 18,
                  ),
                ),
              ),
              Expanded(
                child: CustomListTile(
                  title: requisition.postoAtual.toUpperCase(),
                  subTitle: 'Posto',
                  icon: const FaIcon(FontAwesomeIcons.triangleExclamation),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomListTile(
                  title: requisition.abertura,
                  subTitle: 'Resolução técnica',
                  icon: const FaIcon(FontAwesomeIcons.calendarWeek),
                ),
              ),
              Visibility(
                visible: requisition.fechamento != " ",
                child: Expanded(
                  child: CustomListTile(
                    title: requisition.fechamento,
                    subTitle: 'Encerramento',
                    icon: const FaIcon(FontAwesomeIcons.calendarWeek),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
