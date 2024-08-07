import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class ILastRequisitionsRepository {
  Future<Either<Failure, List<RequisitionEntity>>> fetch();
}
