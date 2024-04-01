import 'failure_strings.dart';

abstract class Failure {
  final String title;
  final String message;

  const Failure({
    required this.message,
    this.title = '',
  });

  List<Object> get props => [title, message];
}

class NoConnectionFailure extends Failure {
  const NoConnectionFailure({required super.message})
      : super(
          title: "Sem conexão",
        );
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({required super.message})
      : super(
          title: "Falha na conexão",
        );
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    required super.message,
  }) : super(
          title: "Sem autorização",
        );
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({
    required super.message,
  }) : super(
          title: "Comunicação perdida",
        );
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    required super.message,
  }) : super(
          title: "Sem informações",
        );
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
  }) : super(
          title: "Problemas técnicos",
        );
}

class ValueFailure<T> extends Failure {
  const ValueFailure({required super.message})
      : super(
          title: "Informações inválidas",
        );
}

class UnrecognizedError extends Failure {
  const UnrecognizedError()
      : super(
          message: Strings.unexpectedError,
        );
}
