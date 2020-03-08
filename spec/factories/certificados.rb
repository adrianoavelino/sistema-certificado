FactoryBot.define do
  factory :certificado do
    ano { FFaker::Time.date.year }
    data_emissao { Time.now }
    aluno
    evento
    titulo { FFaker::Book.title }
    periodo_inicial { "2020-03-04" }
    periodo_final { "2020-03-05" }
    carga_horaria { "12" }
    certification_type
    dados_adicionais { "ACADA. JOANA MARIA SILVA" }
    emission_sector
    observacoes { FFaker::Tweet.body }
  end
end
