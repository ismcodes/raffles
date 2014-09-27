class User < ActiveRecord::Base
	has_many :entries
	has_many :raffles, through: :entries

end
