import '../../../data/repositories/repositories.dart';
import '../../../presentation/components/components.dart';
import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class LoginUsecase {
  Future<UserEntity?> call(
    String login,
    String password,
    String pushId,
  );
}

class ILoginUsecase implements LoginUsecase {
  final LoginRepository repository;

  ILoginUsecase({required this.repository});

  @override
  Future<UserEntity?> call(String login, String password, String pushId) async {
    final result = await repository.login(login, password, pushId);
    final extract = result.fold((failure) => failure, (success) => success);
    if (extract is UserEntity) {
      return extract;
    } else {
      Failure error = extract as Failure;
      CustomSnackbar.call(
        title: error.title,
        description: error.message,
      );
      return null;
    }
  }
}
