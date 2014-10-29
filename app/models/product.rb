class Product < ActiveRecord::Base
	belongs_to :raffle
	include Payola::Sellable
	before_validation :generate_permalink
	def generate_permalink
		self.permalink="http://localhost:3000" unless self.permalink
	end
end
