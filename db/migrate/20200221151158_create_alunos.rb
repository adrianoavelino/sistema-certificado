class CreateAlunos < ActiveRecord::Migration[6.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :ra

      t.timestamps
    end
  end
end
