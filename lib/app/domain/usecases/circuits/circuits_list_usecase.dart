import '../../../data/repositories/repositories.dart';
import '../../../presentation/components/components.dart';
import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class CircuitsListUsecase {
  Future<List<CircuitEntity>> list({String? cnpj});
}

class ICircuitsListUsecase implements CircuitsListUsecase {
  final CircuitsListRepository repository;

  ICircuitsListUsecase({required this.repository});

  @override
  Future<List<CircuitEntity>> list({String? cnpj}) async {
    final result = await repository.list(cnpj: cnpj);
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is List<CircuitEntity>) {
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
