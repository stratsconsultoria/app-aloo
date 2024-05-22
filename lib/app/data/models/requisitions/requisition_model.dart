import '../../../domain/entities/entities.dart';

class RequisitionModel {
  String id;
  String protocolo;
  String solicitante;
  String status;
  String postoAtual;
  String circuito;
  DateTime abertura;
  DateTime? fechamento;

  RequisitionModel({
    required this.id,
    required this.protocolo,
    required this.abertura,
    required this.fechamento,
    required this.solicitante,
    required this.status,
    required this.postoAtual,
    required this.circuito,
  });

  factory RequisitionModel.fromJson(Map<String, dynamic> json) {
    return RequisitionModel(
      id: json['id'],
      protocolo: json['protocolo'],
      solicitante: json['solicitante'],
      status: json['status'] ?? "indisponível",
      postoAtual: json['posto_atual'] ?? "",
      circuito: json['circuito'],
      abertura: DateTime.parse(json['abertura']),
      fechamento: json['fechamento'] != " " ? DateTime.parse(json['fechamento']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'protocolo': protocolo,
      'abertura': abertura,
      'fechamento': fechamento,
      'solicitante': solicitante,
      'status': status,
      'posto_atual': postoAtual,
      'circuito': circuito,
    };
  }

  RequisitionEntity toEntity() => RequisitionEntity(
        id: id,
        protocolo: protocolo,
        solicitante: solicitante,
        status: status,
        postoAtual: postoAtual,
        circuito: circuito,
        abertura: abertura,
        fechamento: fechamento,
      );
}
