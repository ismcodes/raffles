class Raffle < ActiveRecord::Base
	has_many :entries
	has_many :users, through: :entries
	has_one :product
end
