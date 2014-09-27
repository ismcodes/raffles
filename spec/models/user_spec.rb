require 'spec_helper'
describe User do
	User.delete_all
	it 'should create its own password hash from given password' do
		5.times { puts User.count }
		u=User.new(email:"aabbccdd",username:"aabbccdd",password_hash:"hi")
		expect(u.password_hash).to eq "hi"
		u.save
		expect(u.password_hash).not_to eq "hi"
	end

	it 'should create its own password salt' do
		u=User.new(email:"dcba",username:"dcba",password_hash:"hi")
		expect(u.password_salt).to be_nil
		u.save
		u.password_salt.should_not be_nil
	end

	it 'should only change password hash and salt on creation' do
		u=User.create(email:"email@example.com",password_hash:"hi")
		h=u.password_hash
		s=u.password_salt
		u.save
		expect(u.password_hash).to eq h
		expect(u.password_salt).to eq s
	end

	it 'should not allow duplicate usernames/emails to create accounts' do
		
		u=User.create(email:"email@example.com", username:"user", password_hash:"hi")
		expect{User.create(email:"email@example.com", password_hash:"blah")}.not_to change(User, :count)
		expect{User.create(email:"random_email", username:"user", password_hash:"blah")}.not_to change(User, :count)
	end
	it 'should need to choose a password' do 
		expect{User.create(email:"email@example.com",username:"hjkl")}.not_to change(User, :count)
	end
	it 'should need to choose a username' do
	expect{User.create(email:"email@example.com", password_hash:"a")}.not_to change(User, :count)
	end
	it 'should need to choose an email' do
		expect{User.create(username:"hjkl", password_hash:"a")}.not_to change(User, :count)
	end
	it 'should create its own registration object after creation' do
		user=User.new(username:"wheresreg",email:"wheresmyregistration",password_hash:"hi")
		expect(user.registration).to be_nil
		user.save
		expect(user.registration).not_to be_nil
	end
	it 'should need to confirm email to verify account' do
		user=User.create(username:"rspec",email:"rspec@example.com",password_hash:"spec")
		expect(user.verified).to eq false
		user.registration.verify_user
		expect(user.verified).to eq true
	end

end