import 'dart:io' as io;

import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class IAnexosRepository {
  Future<Either<Failure, List<FileEntity>>> list(String atendimento);
  Future<Either<Failure, bool>> addAnexo(String atendimento, io.File file);
}
