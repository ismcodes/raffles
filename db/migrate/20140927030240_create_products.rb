class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.belongs_to :raffle
    	t.string :name
    	t.integer :price
    	t.string :permalink
      t.timestamps
    end
  end
end
