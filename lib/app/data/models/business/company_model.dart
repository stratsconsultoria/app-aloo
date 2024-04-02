import '../../../domain/entities/entities.dart';

class CompanyModel {
  String id;
  String nome;
  String cnpj;

  CompanyModel({
    required this.id,
    required this.nome,
    required this.cnpj,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      nome: json['nome'] ?? 'Nome não informado',
      cnpj: json['cnpj'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'cnpj': cnpj,
      'id': id,
    };
  }

  CompanyEntity toEntity() => CompanyEntity(
        id: id,
        nome: nome,
        cnpj: cnpj,
      );
}
