import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class IRequisitionDetailsRepository {
  Future<Either<Failure, RequisitionDetailsEntity>> fetch(String requisitionId);
}
