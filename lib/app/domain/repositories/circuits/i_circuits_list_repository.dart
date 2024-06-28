import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class ICircuitsListRepository {
  Future<Either<Failure, List<CircuitEntity>>> list({String? cnpj});
}
