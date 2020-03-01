class CreateEmissionSectors < ActiveRecord::Migration[6.0]
  def change
    create_table :emission_sectors do |t|
      t.string :description
      t.timestamps
    end
  end
end
