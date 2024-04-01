import 'package:dartz/dartz.dart';

import '../../../../../core/shared/constants/constants.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/failures.dart';
import '../../../domain/repositories/repositories.dart';
import '../../infra/cache/cache.dart';
import '../../infra/http/http_client.dart';
import '../../infra/http/http_error.dart';
import '../../models/models.dart';

class LoginRepository implements ILoginRepository {
  final IHttpClient httpClient;

  LoginRepository({
    required this.httpClient,
  });

  @override
  Future<Either<Failure, UserEntity>> login(
    String login,
    String password,
    String pushId,
  ) async {
    Map<String, String> header = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    Map<String, String> body = {
      "login": login,
      "password": password,
      "push_id": pushId,
    };
    try {
      final httpResponse = await httpClient.request(
        method: 'post',
        endpoint: Api.login,
        body: body,
        headers: header,
      );
      if (httpResponse['success'] == 1) {
        Map<String, dynamic> profileMap = httpResponse.cast<String, dynamic>();
        await CacheAdapter().writeStorage(CacheString.authTokenKey, profileMap['jwt']);
        final profile = UserData.fromJson(profileMap);
        return Right(profile.toEntity());
      } else {
        return const Left(UnauthorizedFailure(
          message: 'Usuário ou senha incorretos. Tente novamente',
        ));
      }
    } on HttpError catch (e) {
      switch (e) {
        case HttpError.notFound:
          return const Left(
            NotFoundFailure(
              message: 'Houve um erro. Tente novamente',
            ),
          );
        case HttpError.unauthorized:
          return const Left(
            UnauthorizedFailure(
              message: 'Usuário ou senha incorretos. Tente novamente',
            ),
          );
        default:
          return const Left(
            ServerFailure(
              message: 'Falha na comunição com o servidor. Tente novamente',
            ),
          );
      }
    }
  }
}
