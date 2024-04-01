import 'package:dartz/dartz.dart';

import '../../entities/entities.dart';
import '../../helpers/failures.dart';

abstract class ILoginRepository {
  Future<Either<Failure, UserEntity>> login(
    String login,
    String password,
    String pushId,
  );
}
