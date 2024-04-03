import '../../../data/repositories/repositories.dart';
import '../../../presentation/components/components.dart';
import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class RequisitionsListUsecase {
  Future<ApiResponseEntity<RequisitionEntity>> list(int? page);
}

class IRequisitionsListUsecase implements RequisitionsListUsecase {
  final RequisitionsListRepository repository;

  IRequisitionsListUsecase({required this.repository});

  @override
  Future<ApiResponseEntity<RequisitionEntity>> list(int? page) async {
    final result = await repository.list(page);
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is ApiResponseEntity<RequisitionEntity>) {
      return extract;
    } else {
      Failure error = extract as Failure;
      CustomSnackbar.call(
        title: error.title,
        description: error.message,
      );
      return const ApiResponseEntity(
        totalPaginas: 1,
        paginaAtual: 1,
        data: [],
      );
    }
  }
}
