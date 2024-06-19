import '../../../data/repositories/repositories.dart';
import '../../../presentation/components/components.dart';
import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class LastRequisitionsUsecase {
  Future<List<RequisitionEntity>> fetch();
}

class ILastRequisitionsUsecase implements LastRequisitionsUsecase {
  final LastRequisitionsRepository repository;

  ILastRequisitionsUsecase({required this.repository});

  @override
  Future<List<RequisitionEntity>> fetch() async {
    final result = await repository.fetch();
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is List<RequisitionEntity>) {
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
}
