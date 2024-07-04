import 'dart:io' as io;

import '../../../data/repositories/repositories.dart';
import '../../../presentation/components/components.dart';
import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class AnexosUsecase {
  Future<List<FileEntity>> list(String atendimento);
  Future<bool> addAnexo(String atendimento, io.File file);
}

class IAnexosUsecase implements AnexosUsecase {
  final AnexosRepository repository;

  IAnexosUsecase({required this.repository});

  @override
  Future<List<FileEntity>> list(String atendimento) async {
    final result = await repository.list(atendimento);
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is List<FileEntity>) {
      return extract;
    } else {
      Failure error = extract as Failure;
      CustomSnackbar.call(
        title: error.title,
        description: error.message,
      );
      return [];
    }
  }

  @override
  Future<bool> addAnexo(String atendimento, io.File file) async {
    final result = await repository.addAnexo(atendimento, file);
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is bool) {
      return extract;
    } else {
      Failure error = extract as Failure;
      CustomSnackbar.call(
        title: error.title,
        description: error.message,
      );
      return false;
    }
  }
}
