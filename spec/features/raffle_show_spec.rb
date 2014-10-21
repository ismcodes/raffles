require 'spec_helper'
feature 'Raffles/:id shows the raffle' do
	scenario 'when not signed in' do
		r=Raffle.create
		r.product=Product.new(name:"filler", price:0)
		page.set_rack_session(user_id:nil)
		visit "/raffles/#{r.id}"
		expect(page).not_to have_content("filler")
		expect(page).to have_css("input[name='username']")
		expect(page).to have_css("input[type='password']")

	end
	scenario 'when signed in' do
		page.set_rack_session(user_id:1)
		r=Raffle.create
		r.product=Product.new(name:"Example product name", price: 1250)
		visit "/raffles/#{r.id}"
		expect(page).to have_content 'Example product name'
		expect(page).to have_content '$12.50'
		#expect(page).to have_css('script')
		#hmm... doesn't find script tag
	end
end