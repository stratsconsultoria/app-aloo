import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/shared/utils/utils.dart';
import '../../../domain/entities/entities.dart';
import '../../app_routes.dart';
import '../components.dart';

class RequisitionCard extends StatelessWidget {
  final RequisitionEntity requisition;

  const RequisitionCard({
    super.key,
    required this.requisition,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.requisitionDetails,
        arguments: requisition.id,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      requisition.circuito,
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
                StatusIcon(status: requisition.status)
              ],
            ),
            const Divider(thickness: 0.3),
            CustomListTile(
              title: requisition.protocolo,
              subTitle: 'Protocolo',
              icon: const FaIcon(FontAwesomeIcons.circleInfo),
            ),
            const SizedBox(height: 8),
            CustomListTile(
              title: formattedDate(requisition.abertura),
              subTitle: 'Data de abertura',
              icon: const FaIcon(FontAwesomeIcons.calendarDays),
            ),
            const SizedBox(height: 8),
            CustomListTile(
              title: requisition.postoAtual.toUpperCase(),
              subTitle: 'Posto Atual',
              icon: const FaIcon(
                FontAwesomeIcons.layerGroup,
                size: 18,
              ),
            ),
            const SizedBox(height: 8),
            CustomListTile(
              title: requisition.status,
              subTitle: 'Status',
              icon: const FaIcon(
                FontAwesomeIcons.gears,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
