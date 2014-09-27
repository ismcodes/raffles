class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
    	t.belongs_to :user
    	t.string :url
      t.timestamps
    end
  end
end
