class CircuitEntity {
  const CircuitEntity({
    required this.id,
    required this.contrato,
    required this.plano,
    required this.banda,
    required this.logradouro,
    required this.numero,
    required this.bairro,
    required this.cep,
    required this.pontoReferencia,
    required this.cidade,
    required this.estado,
    required this.complemento,
    required this.ativacao,
  });

  final String id,
      contrato,
      plano,
      banda,
      logradouro,
      numero,
      bairro,
      cep,
      pontoReferencia,
      cidade,
      estado;
  final String? complemento;
  final DateTime ativacao;

  List<Object> get props => [
        id,
        contrato,
        plano,
        banda,
        logradouro,
        numero,
        bairro,
        cep,
        pontoReferencia,
        cidade,
        estado,
        ativacao,
      ];
}
