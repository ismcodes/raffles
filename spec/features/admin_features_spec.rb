require 'spec_helper'
feature "Admin interface allows user to create to create raffles" do

scenario "when signed out" do
	page.set_rack_session(user_id:nil)
	visit '/raffles/new'
	expect(page).to have_css("input[name='username']")
	expect(page).to have_css("input[type='password']")
end

scenario "when signed in as non-admin" do
	u=User.create(username:"notadmin", email:"notadmin@example.com", password_hash:"not")
	page.set_rack_session(user_id:u.id)
	r=Raffle.create
	r.product=Product.new(name:"something", price:0)
	#should redirect to /raffles
	visit '/raffles/new'
	expect(page).to have_css(".raffle")
	expect(page).not_to have_css("form")
end

scenario "when signed in as admin" do
	u=User.create(username:"admin", email:"admin@thissite.com", password_hash:"iamadmin")
	page.set_rack_session(user_id:u.id)
	visit '/raffles/new'
	expect(page).to have_css("form")
	expect(page).to have_content("Starts at")
	expect(page).to have_content("Ends at")
	expect(page).to have_content("Entry limit?")
	
end

end