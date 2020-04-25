class RenameEventosToEvent < ActiveRecord::Migration[6.0]
  def change
    rename_column :eventos, :descricao, :description
    rename_column :certificados, :evento_id, :event_id
    rename_table :eventos, :events
  end
end
