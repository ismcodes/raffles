class User < ActiveRecord::Base
	has_many :entries
	has_many :raffles, through: :entries
	validates :username, :email, uniqueness: true, presence: true
	validates_presence_of :password_hash
	before_create :create_bcrypt
	after_create :create_registration
	has_one :registration
	def create_bcrypt
		s=BCrypt::Engine.generate_salt
		self.password_hash=BCrypt::Engine.hash_secret(self.password_hash,s)
		self.password_salt=s
		
		self.verified=false
		true
	end
	
	def create_registration
		self.registration=Registration.new
		# self.registration.send_mail
		# should it automatically send mail on create?
	end
end
