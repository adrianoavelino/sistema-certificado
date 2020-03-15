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
    # avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'test-image.png'), 'image/png') }
    # anexo { fixture_file_upload(Rails.root.join("features", "support", "assets", "test.pdf"), 'apllication/pdf')}
    # file { Rack::Test::UploadedFile.new('spec/factories/test.png', 'image/png') }
    anexo { Rack::Test::UploadedFile.new(Rails.root.join("features", "support", "assets", "test.pdf"), 'application/pdf') }

    observacoes { FFaker::Tweet.body }
  end
end
