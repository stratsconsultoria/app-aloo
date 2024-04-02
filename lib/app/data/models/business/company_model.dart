class CompanyModel {
  String nome;
  String cnpj;
  String id;

  CompanyModel({
    required this.nome,
    required this.cnpj,
    required this.id,
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
}
