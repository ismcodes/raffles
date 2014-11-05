class CreateRaffles < ActiveRecord::Migration
  def change
    create_table :raffles do |t|
      t.integer :minimum_entries
      t.integer :maximum_entries
      t.timestamps
    end
  end
end
