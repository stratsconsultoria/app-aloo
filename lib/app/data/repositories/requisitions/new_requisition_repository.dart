import 'package:dartz/dartz.dart';

import '../../../../../core/shared/constants/constants.dart';
import '../../../domain/helpers/failures.dart';
import '../../../domain/repositories/repositories.dart';
import '../../infra/cache/cache.dart';
import '../../infra/http/http_client.dart';
import '../../infra/http/http_error.dart';

class NewRequisitionRepository implements INewRequisitionRepository {
  final IHttpClient httpClient;

  NewRequisitionRepository({
    required this.httpClient,
  });

  @override
  Future<Either<Failure, bool>> post({
    required String circuit,
    required String description,
    required String type,
  }) async {
    Map<String, String> header = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    String? authToken = await CacheAdapter().read(CacheString.authTokenKey);

    Map<String, dynamic> body = {
      "token": authToken,
      "circuito": circuit,
      "descricao": description,
      "tipo": type,
    };

    try {
      final httpResponse = await httpClient.request(
        method: 'post',
        endpoint: Api.newRequisition,
        body: body,
        headers: header,
      );
      if (httpResponse['success'] == 1) {
        return const Right(true);
      } else if (httpResponse.isEmpty) {
        return const Left(ServerFailure(
          message: 'houve um erro',
        ));
      } else {
        return const Left(ServerFailure(
          message: 'Houve um erro. Tente novamente',
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
