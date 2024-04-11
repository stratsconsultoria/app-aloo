import 'package:dartz/dartz.dart';

import '../../../data/repositories/repositories.dart';
import '../../../presentation/components/components.dart';
import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class RequisitionDetailsUsecase {
  Future<Either<Failure, RequisitionDetailsEntity>> fetch(String requisitionId);
}

class IRequisitionsDetailsUsecase implements RequisitionDetailsUsecase {
  final RequisitionDetailsRepository repository;

  IRequisitionsDetailsUsecase({required this.repository});

  @override
  Future<Either<Failure, RequisitionDetailsEntity>> fetch(String requisitionId) async {
    final result = await repository.fetch(requisitionId);
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is RequisitionDetailsEntity) {
      return right(extract);
    } else {
      Failure error = extract as Failure;
      CustomSnackbar.call(
        title: error.title,
        description: error.message,
      );
      return left(error);
    }
  }
}
