import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class ICompaniesListRepository {
  Future<Either<Failure, List<CompanyEntity>>> list();
}
