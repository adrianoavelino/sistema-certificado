class RenameCertificadoToCertificate < ActiveRecord::Migration[6.0]
  def change
    rename_column :certificados, :ano, :year
    rename_column :certificados, :data_emissao, :date_issue
    rename_column :certificados, :titulo, :title
    rename_column :certificados, :periodo_inicial, :initial_period
    rename_column :certificados, :periodo_final, :final_period
    rename_column :certificados, :carga_horaria, :workload
    rename_column :certificados, :dados_adicionais, :additional_data
    rename_column :certificados, :observacoes, :observation

    rename_table :certificados, :certificate
  end
end
