require "rails_helper"

RSpec.feature "it displays the information for 10 fuel stations according to the specified zip sorted" do
  scenario "user sees info" do
    visit root_path
    fill_in "q", with: "80203"
    click_on "Locate"

    expect(current_path).to eq "/search?zip=80203"

# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
  end
end
