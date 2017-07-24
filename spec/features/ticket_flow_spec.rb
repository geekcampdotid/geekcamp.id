require 'rails_helper'

feature "Ticket Flow" do

  scenario "Visitors can buy a ticket" do
    pending "Next Year!"
    visit home_path
    click_link "Get Tickets", match: :first
    expect(page.current_path).to eq(ticket_path)
  end

end
