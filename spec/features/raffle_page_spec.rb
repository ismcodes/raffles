require 'spec_helper'
feature 'Raffle page shows the raffles' do
	scenario 'when not signed in' do
		page.set_rack_session(user_id:nil)
		visit '/raffles'
		expect(page).not_to have_content 'Enter'
		expect(page).to have_css("input[name='username']")
		expect(page).to have_css("input[type='password']")
	end

	scenario 'when signed in' do
		r=Raffle.create
		r.product=Product.new(name:"expectcss", price:1)
		page.set_rack_session(user_id:1)
		visit '/raffles'
		expect(page).to have_css('.raffle')
	end

end
