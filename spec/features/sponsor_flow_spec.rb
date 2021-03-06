require 'rails_helper'

feature "Sponsorship Flow" do

  scenario "Visitors can navigate to the Sponsorship page" do
    visit home_path
    click_link "Become a Sponsor!", match: :first
    expect(page.current_url).to include(sponsor_path)
  end

end
