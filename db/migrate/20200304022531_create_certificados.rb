class CreateCertificados < ActiveRecord::Migration[6.0]
  def change
    create_table :certificados do |t|
      t.string :ano
      t.date :data_emissao
      t.references :aluno, null: false, foreign_key: true
      t.references :evento, null: false, foreign_key: true
      t.string :titulo
      t.date :periodo_inicial
      t.date :periodo_final
      t.string :carga_horaria
      t.references :certification_type, null: false, foreign_key: true
      t.string :dados_adicionais
      t.references :emission_sector, null: false, foreign_key: true
      t.string :observacoes

      t.timestamps
    end
  end
end
