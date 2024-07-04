import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../components.dart';

class SelectImageBottomSheet extends StatelessWidget {
  final void Function() getImageGallery;
  final void Function() getImageCamera;
  final void Function() getFile;

  const SelectImageBottomSheet({
    super.key,
    required this.getImageGallery,
    required this.getImageCamera,
    required this.getFile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Adicione um anexo ao atendimento',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Flexible(
                child: CustomButtom(
                  onTap: getImageCamera,
                  label: 'Câmera',
                  icon: FaIcon(
                    FontAwesomeIcons.camera,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: CustomButtom(
                  onTap: getImageGallery,
                  label: 'Galeria',
                  icon: FaIcon(
                    FontAwesomeIcons.photoFilm,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomButtom(
            onTap: () => {},
            label: 'Arquivo',
            icon: FaIcon(
              FontAwesomeIcons.file,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
