import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class IRequisitionsListRepository {
  Future<Either<Failure, ApiResponseEntity<RequisitionEntity>>> list(int? page);
}
