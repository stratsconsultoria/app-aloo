import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class IAlertsRepository {
  Future<Either<Failure, List<AlertEntity>>> list();
}
