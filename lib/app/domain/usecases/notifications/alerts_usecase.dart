import '../../../data/repositories/repositories.dart';
import '../../../presentation/components/components.dart';
import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class AlertsUsecase {
  Future<List<AlertEntity>> list();
}

class IAlertsUsecase implements AlertsUsecase {
  final AlertsRepository repository;

  IAlertsUsecase({required this.repository});

  @override
  Future<List<AlertEntity>> list() async {
    final result = await repository.list();
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is List<AlertEntity>) {
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
