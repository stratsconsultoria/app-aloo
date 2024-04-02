import '../../../data/repositories/repositories.dart';
import '../../../presentation/components/components.dart';
import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class CompaniesListUsecase {
  Future<List<CompanyEntity>> list();
}

class ICompaniesListUsecase implements CompaniesListUsecase {
  final CompaniesListRepository repository;

  ICompaniesListUsecase({required this.repository});

  @override
  Future<List<CompanyEntity>> list() async {
    final result = await repository.list();
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is List<CompanyEntity>) {
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
