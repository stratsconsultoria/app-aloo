import 'package:dartz/dartz.dart';

import '../../helpers/failures.dart';

abstract class INewRequisitionRepository {
  Future<Either<Failure, bool>> post({
    required String circuit,
    required String description,
    required String type,
  });
}
