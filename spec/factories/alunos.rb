FactoryBot.define do
  factory :aluno do
    nome { FFaker::NameBR.name }
    ra { FFaker::IdentificationBR.cpf }
  end
end
