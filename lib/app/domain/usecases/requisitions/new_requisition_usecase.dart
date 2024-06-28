import '../../../data/repositories/repositories.dart';

abstract class NewRequisitionUsecase {
  Future<bool> post({
    required String circuit,
    required String description,
    required String type,
  });
}

class INewRequisitionUsecase implements NewRequisitionUsecase {
  final NewRequisitionRepository repository;

  INewRequisitionUsecase({required this.repository});

  @override
  Future<bool> post({
    required String circuit,
    required String description,
    required String type,
  }) async {
    final result = await repository.post(
      circuit: circuit,
      description: description,
      type: type,
    );
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is bool) {
      return extract;
    } else {
      return false;
    }
  }
}
