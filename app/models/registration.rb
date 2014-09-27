class Registration < ActiveRecord::Base
	belongs_to :user
	before_create :create_url
	def verify_user
		self.user.update_attribute(:verified,true)
	end
	def create_url
		require 'securerandom'
		self.url=SecureRandom.hex
		true
	end
end
