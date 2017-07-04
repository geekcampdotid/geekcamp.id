require 'rails_helper'

feature "CFP Flow" do

  scenario "Visitors can navigate to the CFP page" do
    pending("Until next year")

    visit home_path
    click_link "CFP"
    expect(page.current_path).to eq(new_cfp_path)
  end


end
