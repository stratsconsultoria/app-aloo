import 'package:dartz/dartz.dart';

import '../../../../../core/shared/constants/constants.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/failures.dart';
import '../../../domain/repositories/repositories.dart';
import '../../infra/cache/cache.dart';
import '../../infra/http/http_client.dart';
import '../../infra/http/http_error.dart';
import '../../models/models.dart';

class RequisitionsListRepository implements IRequisitionsListRepository {
  final IHttpClient httpClient;

  RequisitionsListRepository({
    required this.httpClient,
  });

  @override
  Future<Either<Failure, ApiResponseEntity<RequisitionEntity>>> list(int? page) async {
    Map<String, String> header = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    String? authToken = await CacheAdapter().read(CacheString.authTokenKey);
    String? companyId = await CacheAdapter().read(CacheString.companyId);

    Map<String, dynamic> body = {
      "token": authToken,
      "page": page ?? 1,
      "empresa": companyId,
    };

    try {
      final httpResponse = await httpClient.request(
        method: 'post',
        endpoint: Api.listRequisitions,
        body: body,
        headers: header,
      );
      if (httpResponse['success'] == 1) {
        ApiResponseEntity<RequisitionEntity> apiResponse = ApiResponseEntity(
          totalPaginas: httpResponse['total_paginas'].ceil(),
          paginaAtual: httpResponse['pagina_atual'],
          data: (httpResponse['atendimentos'] as List<dynamic>)
              .map((e) => RequisitionModel.fromJson(e as Map<String, dynamic>).toEntity())
              .toList(),
        );
        return Right(apiResponse);
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
