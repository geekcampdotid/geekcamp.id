require 'rails_helper'

feature "Sponsorship Flow" do

  scenario "Visitors can navigate to the Sponsorship page" do
    visit home_path
    click_link "Sponsor"
    expect(page.current_path).to eq(sponsor_path)
  end


end
