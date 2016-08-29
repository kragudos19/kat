class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name, :null => false
      t.string :callsign, :null => false
      t.decimal :price_per_month, :null => false
      t.integer :user_id

      t.timestamps
    end
  end
end
