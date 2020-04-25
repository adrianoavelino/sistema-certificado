FactoryBot.define do
  factory :certificado do
    ano { FFaker::Time.between(Date.new(1900), Date.new(2020)).year }
    data_emissao { FFaker::Time.between(Date.new(1900), Date.new(2020)) }
    aluno
    event
    titulo { FFaker::Book.title }
    periodo_inicial { "2020-03-04" }
    periodo_final { "2020-03-05" }
    carga_horaria { "12" }
    certification_type
    dados_adicionais { "ACADA. JOANA MARIA SILVA" }
    emission_sector
    anexo { Rack::Test::UploadedFile.new(Rails.root.join("features", "support", "assets", "test.pdf"), 'application/pdf') }

    observacoes { FFaker::Tweet.body }
  end
end
