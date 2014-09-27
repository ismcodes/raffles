require 'spec_helper'
describe Registration do
	
	it 'should have create its own url after save' do
		r=Registration.new(email:"asdfasdfasdf")
		expect(r.url).to be_nil
		r.save
		expect(r.url).not_to be_nil
	end

end