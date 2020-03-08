FactoryBot.define do
  factory :aluno do
    nome { FFaker::Name.name }
    ra { FFaker::IdentificationBR.cpf }
  end
end
