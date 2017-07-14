require 'rails_helper'

feature "Ticket Flow" do

  scenario "Visitors can buy a ticket" do
    visit home_path
    click_link "Get The App", match: :first
    expect(page.current_path).to eq(apps_path)
  end

end
