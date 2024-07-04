import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../../../core/shared/constants/constants.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/failures.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../presentation/app_routes.dart';
import '../../infra/cache/cache.dart';
import '../../infra/http/http_client.dart';
import '../../infra/http/http_error.dart';
import '../../models/models.dart';

class AnexosRepository implements IAnexosRepository {
  final IHttpClient httpClient;

  AnexosRepository({
    required this.httpClient,
  });

  @override
  Future<Either<Failure, List<FileEntity>>> list(String atendimento) async {
    Map<String, String> header = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    String? authToken = await CacheAdapter().read(CacheString.authTokenKey);

    Map<String, dynamic> body = {
      "token": authToken,
      "atendimento": atendimento,
    };

    try {
      final httpResponse = await httpClient.request(
        method: 'post',
        endpoint: Api.listAnexos,
        body: body,
        headers: header,
      );
      if (httpResponse['success'] == 1) {
        List<FileEntity> apiResponse = (httpResponse['anexo'] as List<dynamic>)
            .map((e) => FileModel.fromJson(e as Map<String, dynamic>).toEntity())
            .toList();
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

  @override
  Future<Either<Failure, bool>> addAnexo(String atendimento, File file) async {
    Map<String, String> header = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    String fileName = file.path.split('/').last;

    String? authToken = await CacheAdapter().read(CacheString.authTokenKey);

    var body = dio.FormData.fromMap({
      "token": authToken,
      "chamado": atendimento,
      "file": await dio.MultipartFile.fromFile(file.path, filename: fileName),
    });

    try {
      final httpResponse = await httpClient.request(
        method: 'post',
        endpoint: Api.addAnexos,
        data: body,
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
          return const Left(ServerFailure(
            message: 'Houve um erro. Tente novamente',
          ));
        case HttpError.unauthorized:
          await CacheAdapter().clear();
          Get.offAndToNamed(Routes.initial);
          return const Left(ServerFailure(
            message: 'Não autorizado, renove suas credenciais',
          ));
        default:
          return const Left(ServerFailure(
            message: 'Houve um erro. Tente novamente',
          ));
      }
    }
  }
}
