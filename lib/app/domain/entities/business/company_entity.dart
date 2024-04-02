class CompanyEntity {
  const CompanyEntity({
    required this.nome,
    required this.cnpj,
    required this.id,
  });

  final String id, nome, cnpj;

  List<Object?> get props => [id, nome, cnpj];
}
