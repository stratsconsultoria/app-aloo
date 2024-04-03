import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
        width: Get.width * 0.6,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 8),
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
            Row(
              children: [
                const FaIcon(FontAwesomeIcons.circleInfo),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      requisition.protocolo,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Protocolo',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            height: 0.8,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const FaIcon(FontAwesomeIcons.calendarDays),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      requisition.abertura,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Data de abertura',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            height: 0.8,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.gears,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      requisition.status,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Status',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            height: 0.8,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
