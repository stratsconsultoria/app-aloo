import '../../../domain/entities/entities.dart';

class CircuitModel {
  String id;
  String contrato;
  String plano;
  String banda;
  String logradouro;
  String numero;
  String bairro;
  String cep;
  String pontoReferencia;
  String cidade;
  String estado;
  String? complemento;
  DateTime ativacao;

  CircuitModel({
    required this.id,
    required this.contrato,
    required this.plano,
    required this.banda,
    required this.logradouro,
    required this.numero,
    required this.bairro,
    required this.cep,
    this.complemento,
    required this.pontoReferencia,
    required this.cidade,
    required this.estado,
    required this.ativacao,
  });

  factory CircuitModel.fromJson(Map<String, dynamic> json) {
    return CircuitModel(
      id: json['id'],
      contrato: json['contrato'],
      plano: json['plano'],
      banda: json['banda'],
      logradouro: json['logradouro'],
      numero: json['numero'],
      bairro: json['bairro'],
      cep: json['cep'],
      complemento: json['complemento'] ?? "",
      pontoReferencia: json['ponto_referencia'],
      cidade: json['cidade'],
      estado: json['estado'],
      ativacao: DateTime.parse(json['ativacao']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'contrato': contrato,
      'plano': plano,
      'banda': banda,
      'logradouro': logradouro,
      'numero': numero,
      'bairro': bairro,
      'cep': cep,
      'complemento': complemento,
      'ponto_referencia': pontoReferencia,
      'cidade': cidade,
      'estado': estado,
      'ativacao': ativacao.toIso8601String(),
    };
  }

  CircuitEntity toEntity() => CircuitEntity(
        id: id,
        contrato: contrato,
        plano: plano,
        banda: banda,
        logradouro: logradouro,
        numero: numero,
        bairro: bairro,
        cep: cep,
        pontoReferencia: pontoReferencia,
        cidade: cidade,
        estado: estado,
        complemento: complemento,
        ativacao: ativacao,
      );
}
