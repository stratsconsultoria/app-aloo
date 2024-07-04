import 'dart:io' as io;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../components/components.dart';
import '../../components/molecules/custom_load_dialog.dart';
import '../../controllers/auth_controller.dart';

class RequisitionDetailsController extends GetxController {
  final String requisitionId;
  final AuthController authController;
  final RequisitionDetailsUsecase requisitionDetailsUsecase;
  final AnexosUsecase anexosUsecase;

  RequisitionDetailsController({
    required this.requisitionId,
    required this.authController,
    required this.requisitionDetailsUsecase,
    required this.anexosUsecase,
  });

  Rx<RequisitionDetailsEntity> requisitionDetails = RequisitionDetailsEntity(
    atendimento: RequisitionEntity(
      id: 'id',
      protocolo: 'protocolo',
      solicitante: '',
      status: '',
      postoAtual: 'postoAtual',
      circuito: 'circuito',
      fechamento: DateTime.now(),
      abertura: DateTime.now(),
    ),
    observacoes: [],
  ).obs;
  RxList<FileEntity> anexos = <FileEntity>[].obs;
  RxBool withImage = false.obs;
  RxBool anexoIsLoading = false.obs;
  RxBool detailsIsLoading = false.obs;
  RxBool withError = false.obs;

  Rx<Uint8List> imageAsByte =
      Uint8List.fromList(List<int>.generate(1024 * 1024, (_) => Random().nextInt(256))).obs;
  final ImagePicker picker = ImagePicker();

  @override
  Future<void> onInit() async {
    fetchAnexos();
    fetchRequisitionDetails();
    super.onInit();
  }

  Future<void> fetchRequisitionDetails() async {
    detailsIsLoading.value = true;
    final result = await requisitionDetailsUsecase.fetch(requisitionId);
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is RequisitionDetailsEntity) {
      requisitionDetails.value = extract;
    } else {
      withError.value = true;
    }
    detailsIsLoading.value = false;
  }

  Future<void> fetchAnexos() async {
    anexoIsLoading.value = true;
    final result = await anexosUsecase.list(requisitionId);
    anexos.assignAll(result);
    anexoIsLoading.value = false;
  }

  Future<void> selectUploadFileType(BuildContext context) async {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SelectImageBottomSheet(
          getImageGallery: () => uploadImage(ImageSource.gallery, context),
          getImageCamera: () => uploadImage(ImageSource.camera, context),
          getFile: () {},
        );
      },
    );
  }

  Future<void> uploadImage(ImageSource imageSource, context) async {
    XFile? pickedImage = await picker.pickImage(source: imageSource);
    if (pickedImage != null) {
      CustomLoadDialog.call(context, title: 'Enviando imagem');
      withImage.value = true;
      io.File file = io.File(pickedImage.path);
      await anexosUsecase.addAnexo(requisitionId, file);
      await fetchAnexos();
      Get.back();
      Get.back();
    }
  }
}
