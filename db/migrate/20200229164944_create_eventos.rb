class CreateEventos < ActiveRecord::Migration[6.0]
  def change
    create_table :eventos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
