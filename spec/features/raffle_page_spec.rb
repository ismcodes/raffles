require 'spec_helper'
feature 'Raffle page shows the raffles' do
	scenario 'when not signed in' do
		visit '/raffles'
		expect(page).not_to have_content 'Enter'
	end

	scenario 'when signed in' do
		r=Raffle.create
		r.product=Product.new(name:"expectcss", price:1)
		page.set_rack_session(user_id:1)
		visit '/raffles'
		expect(page).to have_css('.raffle')
		page.set_rack_session(user_id:nil)
	end

end
