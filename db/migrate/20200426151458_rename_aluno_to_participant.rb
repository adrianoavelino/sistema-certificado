class RenameAlunoToParticipant < ActiveRecord::Migration[6.0]
  def change
    rename_column :alunos, :ra, :rg
    rename_column :alunos, :nome, :name
    rename_column :certificados, :aluno_id, :participant_id
    rename_table :alunos, :participants
  end
end
